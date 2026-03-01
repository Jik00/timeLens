part of 'search_city_cubit.dart';

sealed class SearchCityState extends Equatable {
  const SearchCityState();

  @override
  List<Object> get props => [];
}

final class SearchCityInitial extends SearchCityState {}

final class SearchCityLoading extends SearchCityState {}

final class SearchCitySuccess extends SearchCityState {
  final List<LocationEntity> cities;

  const SearchCitySuccess({required this.cities});

  @override
  List<Object> get props => [cities];
}

final class SearchCityFailure extends SearchCityState {
  final String message;

  const SearchCityFailure({required this.message});

  @override
  List<Object> get props => [message];
}
