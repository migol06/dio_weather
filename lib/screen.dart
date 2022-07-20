import 'package:dio_weather/bloc/weather_bloc.dart';
import 'package:dio_weather/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                hintText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/sun.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatheLoading) {
                      return _buildLoading();
                    } else if (state is WeatherSuccess) {
                      return _buildBody(context, state.model);
                    } else if (state is WeatherError) {
                      return Container();
                    }
                    return Container();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(GetWeatherEvent(cityName: _cityController.text));
                  },
                  child: const Text("Get Weather"),
                )
              ],
            ),
          ],
        ));
  }

  Widget _buildBody(BuildContext context, WeatherModel model) {
    return Column(
      children: [
        Image.asset(
          "assets/images/sun.png",
          height: 200,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model.name!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.main!.temp.toString(),
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
