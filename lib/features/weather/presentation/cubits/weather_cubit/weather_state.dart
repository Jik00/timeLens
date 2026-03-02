part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIdle extends WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;

  const WeatherSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class WeatherFailure extends WeatherState {
  final String message;

  const WeatherFailure({required this.message});

  @override
  List<Object> get props => [message];
}
