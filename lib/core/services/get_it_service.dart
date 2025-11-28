import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/features/home/data/data_sources/supa_era_data_source.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() {
  getIt.registerSingleton(SupabaseEraDataSource(supabase));
  // getIt.registerSingleton<EraRepo>(EraRepoImpl(
  //   dataSource: getIt<SupabaseEraDataSource>(),
  //   storageService: getIt<SupabaseStorageService>(),
  // ));
}