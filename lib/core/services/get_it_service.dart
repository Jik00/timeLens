import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/core/network/dio_factory.dart';
import 'package:timelens/features/chatbot/data/repos/chat_repo_impl.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';
import 'package:timelens/features/home/domain/repos/era_repo.dart';
import 'package:timelens/features/home/data/repos/era_repo_impl.dart';
import 'package:timelens/core/services/weather_api_service.dart';
import 'package:timelens/features/home/data/data_sources/supa_era_data_source.dart';
import 'package:timelens/features/weather/data/repo/weather_repo_impl.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() {
  getIt.registerSingleton(SupabaseEraDataSource(supabase));
  getIt.registerSingleton<EraRepo>(EraRepoImpl(
    dataSource: getIt<SupabaseEraDataSource>(),
  ));

  getIt.registerSingleton<Dio>( DioFactory().createDio());
  getIt.registerSingleton(WeatherApiService(dio: getIt<Dio>()));
  getIt.registerSingleton <WeatherRepo>( WeatherRepoImpl(apiService: getIt<WeatherApiService>()));

  getIt.registerSingleton<ChatRepo>(ChatRepoImpl(supabase: supabase));

}
