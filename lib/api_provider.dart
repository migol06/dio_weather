import 'package:dio/dio.dart';
import 'package:dio_weather/model.dart';

class ApiProvider {
  String url = 'https://api.openweathermap.org/data/2.5/weather';
  String key = 'e3da0dbf133b9560f178270040d27620';

  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
      connectTimeout: 50000,
      receiveTimeout: 20000));

  Future<WeatherModel> getWeather(String location) async {
    try {
      Response response =
          await _dio.get('?q=$location&appid=$key&units=metric');
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw 'Error';
    }
  }
}
