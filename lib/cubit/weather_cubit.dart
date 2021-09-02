import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/data/model/weather.dart';
import 'package:bloc_weather_app/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async{
    try{
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather: weather));
    } on NetworkException{
      emit(WeatherError(message: "Couldn't fetch weather. Is the divice online?"));
    }
  }

}
