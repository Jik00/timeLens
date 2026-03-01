import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';
import 'package:timelens/features/weather/domain/repo/weather_repo.dart';

part 'search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  SearchCityCubit({required this.weatherRepo}) : super(SearchCityInitial());

  final WeatherRepo weatherRepo;

  Timer? _debounce;

  Future<void> searchCity(String cityName) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () async {
        if (cityName.trim().isEmpty) {
          emit(SearchCityInitial());
          return;
        }

        emit(SearchCityLoading());

        var result = await weatherRepo.searchLocation(cityName);

        result.fold(
          (failure) => emit(SearchCityFailure(message: failure.message)),
          (cities) => emit(
            SearchCitySuccess(cities: cities),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}