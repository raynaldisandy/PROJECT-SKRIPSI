import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_ripplebutton.dart';
import 'package:skinalertsv2/Widget/user_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);

    final htmldata1 = """ <div style="text-align: justify;">
    <h2>GEJALA KANKER KULIT & JENIS – JENIS NYA</h2>
    <p>
        Kanker kulit merupakan pertumbuhan abnormal pada sel-sel kulit akibat kerusakan DNA yang umumnya disebabkan oleh paparan sinar ultraviolet (UV) secara berlebihan. Gejalanya dapat berupa perubahan pada tekstur kulit, munculnya benjolan atau bercak berwarna yang tidak biasa, serta luka yang tidak kunjung sembuh. Kondisi ini umumnya terjadi di bagian tubuh yang sering terpapar sinar matahari seperti wajah, leher, lengan, dan tungkai. Deteksi dini menjadi faktor penting dalam penanganan karena sebagian besar kanker kulit dapat disembuhkan jika ditemukan pada tahap awal.
    </p>
    
    <p>
        Berdasarkan klasifikasi medis dan dataset dermatologi seperti HAM10000, terdapat tujuh jenis utama kanker kulit, yaitu:
    </p>
    
    <ol>
        <li><strong>Actinic Keratoses (AKIEC)</strong> – Lesi prakanker akibat paparan sinar matahari jangka panjang yang dapat berkembang menjadi karsinoma sel skuamosa.</li>
        <li><strong>Basal Cell Carcinoma (BCC)</strong> – Jenis kanker kulit paling umum, biasanya tampak sebagai benjolan kecil mengilap atau luka yang tidak sembuh-sembuh.</li>
        <li><strong>Benign Keratosis-like Lesions (BKL)</strong> – Lesi jinak yang menyerupai kanker kulit, biasanya berupa bercak cokelat atau abu-abu yang kasar.</li>
        <li><strong>Dermatofibroma (DF)</strong> – Benjolan kecil jinak berwarna cokelat kemerahan yang sering muncul akibat reaksi terhadap luka kecil pada kulit.</li>
        <li><strong>Melanocytic Nevi (NV)</strong> – Tahi lalat atau bintik cokelat yang umumnya jinak, namun perlu diawasi bila mengalami perubahan</li>
        <li><strong>Vascular Lesions (VASC)</strong> – Kelainan pembuluh darah yang tampak sebagai bercak merah atau ungu di kulit.</li>
        <li><strong>Melanoma (MEL)</strong> – Jenis kanker kulit paling berbahaya yang berkembang dari sel penghasil pigmen (melanosit) dan dapat menyebar ke organ lain dengan cepat.</li>
    </ol>
    
    <p>
        Gejala dari ketujuh jenis kanker kulit tersebut bervariasi, namun umumnya melibatkan perubahan warna kulit, bentuk tahi lalat yang tidak simetris, tepi yang tidak rata, ukuran yang membesar, hingga luka yang tidak sembuh dalam waktu lama. Penting untuk melakukan pemeriksaan kulit secara rutin, baik mandiri maupun oleh tenaga medis, terutama bagi individu dengan riwayat paparan sinar matahari berlebih atau faktor genetik. Dengan deteksi dini dan pengobatan yang tepat, peluang penyembuhan kanker kulit dapat meningkat secara signifikan.
    </p>
    
    <h2>DIAGNOSIS AND TREATMENT</h2>
    <p>
        Diagnosis kanker kulit merupakan tahapan penting untuk memastikan jenis, stadium, serta strategi pengobatan yang tepat. Pemeriksaan dimulai dengan observasi klinis oleh dokter kulit, di mana area tubuh yang mencurigakan diperiksa secara visual untuk menilai bentuk, ukuran, warna, dan tekstur lesi. Dokter biasanya menggunakan dermatoskop, yaitu alat pembesar khusus yang memungkinkan visualisasi struktur mikroskopis kulit. Pada tahap ini, perubahan pada tahi lalat atau bercak kulit seperti asimetri, tepi tidak rata, warna tidak seragam, atau pertumbuhan cepat menjadi indikator penting adanya keganasan. Bila ditemukan indikasi mencurigakan, langkah berikutnya adalah biopsi kulit, di mana sebagian kecil jaringan diambil dan dianalisis di laboratorium histopatologi untuk menentukan apakah sel-sel tersebut termasuk ganas atau tidak.
    </p>
    
    <p>
        Dalam penelitian dermatologi modern, terutama berdasarkan dataset HAM10000, diagnosis kanker kulit kini semakin presisi dengan bantuan teknologi Artificial Intelligence (AI). Model berbasis Convolutional Neural Network (CNN) digunakan untuk mengenali pola-pola visual yang khas pada tujuh jenis utama kanker kulit, yaitu Actinic Keratoses (AKIEC), Basal Cell Carcinoma (BCC), Benign Keratosis-like Lesions (BKL), Dermatofibroma (DF), Melanocytic Nevi (NV), Vascular Lesions (VASC), dan Melanoma (MEL). Teknologi ini membantu dokter mempercepat diagnosis serta meningkatkan akurasi dalam membedakan antara lesi jinak dan ganas. Selain itu, pencitraan digital seperti Total Body Photography (TBP) dan Sequential Digital Dermoscopy Imaging (SDDI) juga digunakan untuk memantau perubahan lesi dari waktu ke waktu secara non-invasif.
    </p>
    
    <p>
        Setelah diagnosis ditegakkan, pengobatan kanker kulit dilakukan berdasarkan jenis dan tingkat keparahannya. Pada Basal Cell Carcinoma (BCC) dan Actinic Keratoses (AKIEC), tindakan umum meliputi eksisi bedah sederhana, krioterapi (pembekuan jaringan kanker dengan nitrogen cair), atau terapi fotodinamik (PDT) yang menggunakan kombinasi cahaya dan obat fotosensitizer untuk menghancurkan sel kanker. Untuk Melanoma (MEL) yang bersifat agresif, pengobatan biasanya memerlukan pembedahan lanjutan (wide local excision), disertai terapi imun (immunotherapy) seperti pembrolizumab atau nivolumab, dan targeted therapy untuk menghambat pertumbuhan sel kanker pada tingkat genetik. Sementara itu, lesi jinak seperti Dermatofibroma (DF) atau Benign Keratosis-like Lesions (BKL) umumnya hanya diobservasi, kecuali menimbulkan gangguan fungsional atau estetika.
    </p>
    
    <p>
        Selain terapi medis, aspek perawatan pencegahan (preventive care) juga menjadi bagian penting dalam manajemen kanker kulit. Pasien disarankan untuk rutin menggunakan tabir surya dengan SPF minimal 30, menghindari paparan sinar matahari langsung antara pukul 10.00–16.00, mengenakan pakaian pelindung seperti topi dan kacamata UV, serta memeriksa kondisi kulit secara mandiri setiap bulan. Individu dengan riwayat keluarga penderita kanker kulit atau dengan kulit terang perlu melakukan pemeriksaan dermatologi profesional secara berkala, minimal dua kali setahun. Pendekatan terpadu yang melibatkan diagnosis akurat, pengobatan berbasis bukti, dan kesadaran diri dalam pencegahan terbukti efektif menurunkan tingkat kekambuhan serta meningkatkan prognosis jangka panjang bagi pasien kanker kulit.
    </p>
</div>
    """;

    final List<String> imgList = [
      AssetList.exampleSkinCarousale,
      AssetList.exampleSkinCarousale,
      AssetList.exampleSkinCarousale,
    ];
    final FrameController frameController = Get.put(FrameController());
    SizeConfig().init(context);
    return Container(
      color: AppColors.backgroundcolor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SpaceSizer(
              vertical: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              UserPicture(),
              SpaceSizer(
                horizontal: 6,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeaguespartanTextView(
                      value:
                          "${frameController.getGreeting()} and Keep Healthy",
                      color: AppColors.textblackcolour,
                    ),
                    SpaceSizer(
                      vertical: 1,
                    ),
                    Obx(
                      () => LeaguespartanTextView(
                        value: frameController.userName.value,
                        color: AppColors.textblackcolour,
                        size: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])
            ]),
            SizedBox(
              width: SizeConfig.horizontal(100),
              height: SizeConfig.horizontal(60),
              child: CarouselSlider.builder(
                  carouselController: frameController.carouselController,
                  options: CarouselOptions(
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1500),
                      autoPlay: true,
                      aspectRatio: 9 / 4,
                      enlargeCenterPage: true,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        frameController.currentDot(index);
                      }),
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index,
                          int realIndex) =>
                      Center(
                          child: CustomRippleButton(
                              radius: 0,
                              onTap: () {},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.horizontal(2))),
                                  child: imgList.isEmpty
                                      ? const CircularProgressIndicator()
                                      : Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors
                                                      .buttoncolorgreendark,
                                                  width: SizeConfig.horizontal(
                                                      1))),
                                          child: Image.asset(imgList[index],
                                              fit: BoxFit.fill,
                                              width: SizeConfig.horizontal(100),
                                              height:
                                                  SizeConfig.horizontal(100)),
                                        ))))),
            ),
            TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                  color: AppColors.buttoncolorgreendark,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.horizontal(99)))),
              indicatorColor: AppColors.buttoncolorgreendark,
              unselectedLabelColor: AppColors.buttoncolorgreendark,
              labelColor: Colors.white,
              labelStyle: leagueSpartanStyle()
                  .labelStyle(AppColors.buttoncolorgreendark),
              tabs: <Widget>[
                Tab(
                  text: 'Symptoms',
                ),
                Tab(
                  text: 'Diagnosis And\n Treatment',
                ),
                Tab(
                  text: 'Click For Check',
                ),
              ],
            ),
            const Divider(
                height: 20,
                thickness: 0.8,
                indent: 0,
                endIndent: 0,
                color: Colors.black),
            SpaceSizer(
              vertical: 2,
            ),
            SizedBox(
              height: SizeConfig.horizontal(100),
              child: TabBarView(controller: tabController, children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontal(2)),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.horizontal(2))),
                          border: Border.all(
                              color: Colors.black,
                              width: SizeConfig.horizontal(0.5))),
                      child:
                          SingleChildScrollView(child: Html(data: htmldata1))),
                )),
                Center(child: Text("It's cloudy here2")),
                Center(child: Text("It's cloudy here3")),
              ]),
            ),
            SpaceSizer(
              vertical: 8,
            )
          ],
        ),
      ),
    );
  }
}
