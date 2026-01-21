import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skinalertsv2/Pages/result_view.dart';
import 'package:skinalertsv2/Utils/enum.dart';
import 'package:skinalertsv2/helpers/snackbar.dart';

import 'package:http_parser/http_parser.dart';

class ScanController extends GetxController {
  File? imageSkin;
  RxString result = RxString('');
  RxString sicknessResult = RxString('');
  RxString scanAccuracy = RxString('');
  User? user;
  RxString urlImage = RxString('');
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  RxBool isLoading = RxBool(false);

  String formatIndonesianDateTime(DateTime dateTime) {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    final hour = dateTime.hour;
    final minute = dateTime.minute;

    // Format waktu menjadi 12.00 WIB
    final timeFormatted =
        '${hour.toString().padLeft(2, '0')}.${minute.toString().padLeft(2, '0')} WIB';

    return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year} | $timeFormatted';
  }

  String getFormattedTimestampIndonesia() {
    final now = DateTime.now();
    return formatIndonesianDateTime(now);
  }

  Future<void> scanHistory(String username, String imageScan) async {
    try {
      final timestamp = DateTime.now();
      final formattedTime = formatIndonesianDateTime(timestamp);

      await FirebaseFirestore.instance
          .collection('history_scanner')
          .doc(username)
          .update({
        'scan_history': FieldValue.arrayUnion([
          {
            'image_scan': '$imageScan.jpg',
            'scan_accuracy': scanAccuracy.value,
            'virus_detected': sicknessResult.value,
            'creation_time': formattedTime, // Format Indonesia
            'timestamp': timestamp.millisecondsSinceEpoch, // Untuk sorting
            'timestamp_iso': timestamp.toIso8601String(), // Backup format
          }
        ]),
        'username': username,
        'last_updated': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is FirebaseException && e.code == 'not-found') {
        final timestamp = DateTime.now();
        final formattedTime = formatIndonesianDateTime(timestamp);

        await FirebaseFirestore.instance
            .collection('history_scanner')
            .doc(username)
            .set({
          'username': username,
          'scan_history': [
            {
              'image_scan': '$imageScan.jpg',
              'creation_time': formattedTime,
              'scan_accuracy': scanAccuracy.value,
              'virus_detected': sicknessResult.value,
              'timestamp': timestamp.millisecondsSinceEpoch,
              'timestamp_iso': timestamp.toIso8601String(),
            }
          ],
          'created_at': FieldValue.serverTimestamp(),
          'last_updated': FieldValue.serverTimestamp(),
        });
      } else {
        rethrow;
      }
    }
  }

  // Fungsi untuk mengkompres gambar hingga di bawah 2MB
  static Future<File> compressImage(File originalImage,
      {int maxSizeKB = 2000}) async {
    try {
      // Baca file asli
      List<int> imageBytes = await originalImage.readAsBytes();

      // Jika sudah di bawah 2MB, return asli
      if (imageBytes.length <= maxSizeKB * 1024) {
        return originalImage;
      }

      // Decode gambar
      img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));
      if (image == null) return originalImage;

      // Dapatkan direktori temporary
      final tempDir = await getTemporaryDirectory();
      final String tempPath =
          '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Kompres dengan quality 75% terlebih dahulu
      int quality = 75;
      Uint8List compressedBytes = img.encodeJpg(image, quality: quality);

      // Jika masih terlalu besar, kurangi quality
      while (compressedBytes.length > maxSizeKB * 1024 && quality > 30) {
        quality -= 10;
        compressedBytes = img.encodeJpg(image, quality: quality);
      }

      // Jika masih terlalu besar, kurangi resolusi
      if (compressedBytes.length > maxSizeKB * 1024) {
        img.Image resizedImage =
            img.copyResize(image, width: (image.width * 0.7).round());
        compressedBytes = img.encodeJpg(resizedImage, quality: 60);
      }

      // Tulis file yang sudah dikompres
      File compressedFile = File(tempPath);
      await compressedFile.writeAsBytes(compressedBytes.toList());

      return compressedFile;
    } catch (e) {
      print('Error compressing image: $e');
      return originalImage;
    }
  }

  String getFormattedTimestamp() {
    final now = DateTime.now();
    final format = DateFormat('HHmmddMMyyyy');
    return format.format(now);
  }

  Future<void> pickImage(
    ImageSource source,
    String username,
  ) async {
    try {
      // 1. Pick image
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        result.value = 'Pemilihan gambar dibatalkan';
        update();
        return;
      }

      // 2. Set loading state
      isLoading.value = true;
      update();

      // 3. Set image file dan kompres
      File originalImage = File(pickedImage.path);
      log('Original image size: ${await originalImage.length()} bytes');

      // 4. Kompres gambar sebelum upload
      File compressedImage = await compressImage(originalImage);
      imageSkin = compressedImage;
      log('Compressed image size: ${await compressedImage.length()} bytes');
      log('Image path: ${imageSkin!.path}');

      // 5. Upload ke ML Server (jika diperlukan)
      await _uploadImageToServer(imageSkin!);
      // 6. Upload ke Firebase Storage
      user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final metadata = SettableMetadata(contentType: 'image/jpeg');
      final ref = firebaseStorage
          .ref('users')
          .child('user_history')
          .child(user!.uid)
          .child('${getFormattedTimestamp()}.jpeg');

      // 7. Upload file yang sudah dikompres ke Firebase
      await ref.putFile(imageSkin!, metadata);
      final String url = await ref.getDownloadURL();
      log('Download URL: $url');

      // 8. Update state
      urlImage.value = url;
      result.value = 'Upload berhasil';
      await scanHistory(
        username,
        urlImage.value,
      );

      // 9. Navigate ke ResultView
      Get.to(() => ResultView(
            scanAccuracy: scanAccuracy.value,
            scanImage: imageSkin.toString(),
            sicknessResult: sicknessResult.value,
          ));
    } catch (e) {
      // Error handling
      isLoading.value = false;
      result.value = 'Error: ${e.toString()}';
      log('Error details: $e');

      Snack.show(
          SnackbarType.error, 'Terjadi Error', 'Coba kembali beberapa saat...');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  // Future<void> _uploadImageToServer(File imageFile) async {
  //   try {
  //     // final uri = Uri.parse('http://skin-alert-479308.dt.r.appspot.com');
  //     final uri =
  //         Uri.parse('https://skin-alert-479308.dt.r.appspot.com/predict');

  //     final request = http.MultipartRequest('POST', uri);

  //     request.headers.addAll({
  //       'Accept': 'application/json',
  //     });

  //     request.files.add(
  //       await http.MultipartFile.fromPath('file', imageFile.path,
  //           filename: imageFile.path.split('/').last, ),
  //     );

  //     final response = await request.send();
  //     final responseData = await response.stream.bytesToString();

  //     if (response.statusCode == 200) {
  //       final decoded = json.decode(responseData);
  //       double confidence = (decoded['confidence'] as num).toDouble();
  //       String confidenceStr = confidence.toStringAsFixed(2);

  //       result.value =
  //           '${decoded['predicted_class']} dengan tingkat keyakinan\n$confidenceStr%';
  //       sicknessResult.value = decoded['predicted_class'];
  //       scanAccuracy.value = confidenceStr;
  //       log('Berhasil: ${result.value}');
  //     } else {
  //       result.value = 'Server error: ${response.statusCode} - $responseData';
  //       log('Gagal: ${responseData}');
  //       Snack.show(SnackbarType.error, 'Error Upload File Failed',
  //           'Coba kembali beberapa saat...');
  //     }
  //   } catch (e) {
  //     result.value = 'Upload error: ${e.toString()}';
  //     log('Upload error: $e');
  //     rethrow;
  //   } finally {
  //     update();
  //   }
  // }

  Future<void> _uploadImageToServer(File imageFile) async {
    try {
      final uri = Uri.parse(
        'https://skin-cancer-api-648164371592.asia-southeast2.run.app/predict',
      );

      final request = http.MultipartRequest('POST', uri);

      final ext = imageFile.path.split('.').last.toLowerCase();
      final mime = ext == 'png' ? 'png' : 'jpeg';

      request.headers['Accept'] = 'application/json';

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          filename: imageFile.path.split('/').last,
          contentType: MediaType('image', mime),
        ),
      );

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception(
          'HTTP ${response.statusCode}: $responseBody',
        );
      }

      final decoded = json.decode(responseBody);

      // final double confidence =
      //     (decoded['confidence'] as num).toDouble() * 100;

      final confidence = decoded['confidence'];

      result.value =
          '${decoded['predicted_class']} dengan tingkat keyakinan\n $confidence';

      sicknessResult.value = decoded['predicted_class'];
      scanAccuracy.value = confidence;
    } finally {
      update();
    }
  }
}
