// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanHistory _$ScanHistoryFromJson(Map<String, dynamic> json) => ScanHistory(
      creationTime: json['creation_time'] as String,
      imageScan: json['image_scan'] as String,
      timeStamp: (json['timestamp'] as num).toDouble(),
      timeStampIso: json['timestamp_iso'] as String,
      scanAccuracy: json['scan_accuracy'] as String,
      virusDetected: json['virus_detected'] as String,
    );

Map<String, dynamic> _$ScanHistoryToJson(ScanHistory instance) =>
    <String, dynamic>{
      'creation_time': instance.creationTime,
      'image_scan': instance.imageScan,
      'timestamp': instance.timeStamp,
      'timestamp_iso': instance.timeStampIso,
      'scan_accuracy': instance.scanAccuracy,
      'virus_detected': instance.virusDetected,
    };
