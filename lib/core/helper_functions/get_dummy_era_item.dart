import 'package:timelens/features/home/domain/entities/era_entity.dart';

EraEntity getDummyEra() {
  return EraEntity(
    eraCode: "1",
    eraName: "The Roman Empire",
    eraPeriod: "(1000-2000)",
    imageUrl:
        "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
  );
}

List<EraEntity> getDummyEras() => List.generate(5, (index) => getDummyEra());
