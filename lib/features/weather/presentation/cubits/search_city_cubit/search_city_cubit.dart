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
  String _lastSearchedQuery = ''; // Track last searched query to avoid duplicates

  Future<void> searchCity(String cityName) async {
    // Cancel any existing timer
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    // Don't search if the query is the same as the last searched one
    if (cityName.trim() == _lastSearchedQuery) {
      return;
    }

    // If empty query, clear results immediately
    if (cityName.trim().isEmpty) {
      _lastSearchedQuery = '';
      emit(SearchCityInitial());
      return;
    }

    // Set up new debounce timer
    _debounce = Timer(const Duration(milliseconds: 800), () async {
      // Store the query we're searching for
      _lastSearchedQuery = cityName.trim();

      emit(SearchCityLoading());

      var result = await weatherRepo.searchLocation(cityName.trim());

      result.fold(
        (failure) => emit(SearchCityFailure(message: failure.message)),
        (cities) => emit(SearchCitySuccess(cities: cities)),
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
