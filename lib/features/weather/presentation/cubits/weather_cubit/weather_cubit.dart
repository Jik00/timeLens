import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/weather/domain/entities/weather_entity.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherRepo}) : super(WeatherInitial());

  final WeatherRepo weatherRepo;

  Future<void> getWeatherDetails(String cityName) async {

    if (cityName.trim().isEmpty) {
      emit(WeatherInitial());
      return;
    }
    emit(WeatherLoading());

    var result = await weatherRepo.getWeatherDetails(cityName);

    result.fold(
      (failure) => emit(WeatherFailure(message: failure.message)),
      (weatherEntity) => emit(WeatherSuccess(weather: weatherEntity)),
    );
  }
}
