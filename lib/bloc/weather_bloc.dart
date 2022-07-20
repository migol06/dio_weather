import 'package:bloc/bloc.dart';
import 'package:dio_weather/api_repository.dart';
import 'package:dio_weather/model.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    ApiRepository repository = ApiRepository();
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetWeatherEvent>((event, emit) async {
      try {
        emit(WeatheLoading());
        final response = await repository.getWeather(event.cityName);
        emit(WeatherSuccess<WeatherModel>(model: response));
      } catch (e) {
        emit(WeatherError(error: e.toString()));
      }
    });
  }
}
