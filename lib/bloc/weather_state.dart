part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({
    required this.weather,
  });

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
          (o is WeatherLoaded &&
              runtimeType == o.runtimeType &&
              weather == o.weather);

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError({
    required this.message,
  });


  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
          (o is WeatherError &&
              runtimeType == o.runtimeType &&
              message == o.message
          );


  @override
  int get hashCode =>
      message.hashCode;
}
