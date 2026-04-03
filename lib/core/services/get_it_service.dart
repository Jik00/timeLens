import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timelens/core/data_sources/data_source.dart';
import 'package:timelens/core/network/dio_factory.dart';
import 'package:timelens/core/services/supabase_auth_service.dart';
import 'package:timelens/features/auth/data/repos/auth_repo_impl.dart';
import 'package:timelens/features/auth/domain/repos/auth_repo.dart';
import 'package:timelens/features/chatbot/data/repos/chat_repo_impl.dart';
import 'package:timelens/features/chatbot/domain/repos/chat_repo.dart';
import 'package:timelens/features/figures/data/repo/figure_repo_impl.dart';
import 'package:timelens/features/figures/domain/repos/figure_repo.dart';
import 'package:timelens/features/eras/domain/repos/era_repo.dart';
import 'package:timelens/features/eras/data/repos/era_repo_impl.dart';
import 'package:timelens/core/services/weather_api_service.dart';
import 'package:timelens/core/data_sources/supa_data_source.dart';
import 'package:timelens/features/weather/data/repo/weather_repo_impl.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() {
  /// data source \\\
  getIt.registerSingleton<DataSource>(SupabaseDataSource(supabase));

  /// services \\\
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<Dio>(DioFactory().createDio());
  getIt.registerSingleton(WeatherApiService(dio: getIt<Dio>()));

  /// repos \\\
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    dataSource: getIt<SupabaseDataSource>(),
    supabaseAuthService: getIt<SupabaseAuthService>(),
  ));

  getIt.registerSingleton<EraRepo>(EraRepoImpl(
    dataSource: getIt<SupabaseDataSource>(),
  ));

  getIt.registerSingleton<FigureRepo>(FigureRepoImpl(
    dataSource: getIt<SupabaseDataSource>(),
  ));

  getIt.registerSingleton<WeatherRepo>(
      WeatherRepoImpl(apiService: getIt<WeatherApiService>()));

  getIt.registerSingleton<ChatRepo>(ChatRepoImpl(
    supabase: supabase,
    dataSource: getIt<SupabaseDataSource>(),
  ));
}
