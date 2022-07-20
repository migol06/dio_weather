// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatheLoading extends WeatherState {}

class WeatherSuccess<T> extends WeatherState {
  final T model;

  const WeatherSuccess({
    required this.model,
  });
}

class WeatherError extends WeatherState {
  final String? error;

  const WeatherError({
    this.error,
  });
}
