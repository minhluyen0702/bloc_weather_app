part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  get position => null;

}
class FetchWeather extends WeatherEvent{
  @override
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object?> get props => [position];
}
