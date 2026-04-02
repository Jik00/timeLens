class FigureEntity {
  final String figureName;
  final String dynasty;
  final String reignPeriod;
  final String belongEra;
  final String imageUrl;
  final String ready;

  FigureEntity({
    required this.figureName,
    required this.dynasty,
    required this.reignPeriod,
    required this.belongEra,
    required this.imageUrl, required this.ready,
  });

  factory FigureEntity.fromMap(Map<String, dynamic> json) => FigureEntity(
        figureName: json['figure_name'],
        dynasty: json['dynasty'],
        reignPeriod: json['reign_period'],
        belongEra: json['belong_era'],
        imageUrl: json['image_url'],
        ready: json['ready'],
      );
}