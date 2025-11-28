class EraModel {
  final String eraName;
  final String eraPeriod;
  final String eraCode;
  final String imageUrl;
  final DateTime? createdAt;

  EraModel({
    required this.eraName,
    required this.eraPeriod,
    required this.eraCode,
    required this.imageUrl,
    this.createdAt,
  });
}