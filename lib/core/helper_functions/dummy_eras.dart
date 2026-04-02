import 'package:timelens/features/eras/domain/entities/era_entity.dart';
import 'package:timelens/generated/l10n.dart';

EraEntity dummyEra() {
  return EraEntity(
    eraCode: "1",
    eraName: S().loading,
    eraPeriod: S().loading,
    imageUrl:
        "https://bgiyysstohukhiztkyju.supabase.co/storage/v1/object/public/eras/era_place_holder/era_place_holder.png",
  );
}

List<EraEntity> dummyEras() => List.generate(2, (index) => dummyEra());
