class StopModel {
  final String stopname;
  final double latitude;
  final double longitude;
  final int timedifference;

  StopModel({
    required this.stopname,
    required this.latitude,
    required this.longitude,
    required this.timedifference,
  });

  factory StopModel.fromJson(Map<String, dynamic> json) {
    return StopModel(
      stopname: json['stopname'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      timedifference: json['timedifference'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'stopname': stopname,
    'latitude': latitude,
    'longitude': longitude,
    'timedifference': timedifference,
  };
}
