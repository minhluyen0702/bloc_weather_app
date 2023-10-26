import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../data/my_data.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(API_KEY, language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherSuccess(weather));
      } catch (e) {
        log(e.toString());
        emit(WeatherFailure());
      }
    });
  }
}
