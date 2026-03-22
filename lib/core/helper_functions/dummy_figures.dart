import 'package:timelens/features/figures/domain/entities/figure_entity.dart';

FigureEntity dummyFigure() {
  return FigureEntity(
    figureName: 'Ramses II',
    reignPeriod: '(1279 - 1213)',
    dynasty: '19',
    belongEra: 'The New Kingdom',
    imageUrl:
        'https://bgiyysstohukhiztkyju.supabase.co/storage/v1/object/public/figures/ramses_ii/remses_statue.png',
  );
}

List<FigureEntity> dummyFigures() => List.generate(3, (index) => dummyFigure ());