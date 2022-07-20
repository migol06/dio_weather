import 'package:dio_weather/api_provider.dart';
import 'package:dio_weather/model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<WeatherModel> getWeather(String location) {
    return _provider.getWeather(location);
  }
}
