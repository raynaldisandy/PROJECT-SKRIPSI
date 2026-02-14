import 'package:json_annotation/json_annotation.dart';


part 'history_model.g.dart';

@JsonSerializable()
class ScanHistory {
  ScanHistory({
    required this.creationTime,
    required this.imageScan,
    required this.timeStamp,
    required this.timeStampIso,
    required this.scanAccuracy,
    required this.virusDetected,
  });
  factory ScanHistory.fromJson(Map<String, dynamic> json) =>
      _$ScanHistoryFromJson(json);
  @JsonKey(name: 'creation_time')
  String creationTime;
  @JsonKey(name: 'image_scan')
  String imageScan;
  @JsonKey(name: 'timestamp')
  double timeStamp;
  @JsonKey(name: 'timestamp_iso')
  String timeStampIso;
   @JsonKey(name: 'scan_accuracy')
  String scanAccuracy;
   @JsonKey(name: 'virus_detected')
  String virusDetected;


  Map<String, dynamic> toJson() => _$ScanHistoryToJson(this);
}