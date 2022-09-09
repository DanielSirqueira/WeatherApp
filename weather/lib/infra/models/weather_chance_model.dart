import 'package:weather/domain/entities/weather_hours.dart';

export 'weather_chance_model.dart';

class WeatherChanceModel {
  double chanceOfFog;
  double chanceOfFrost;
  double chanceOfHighTemp;
  double chanceOfOvercast;
  double chanceOfRain;
  double chanceOfDry;
  double chanceOfSnow;
  double chanceOfSunshine;
  double chanceOfThunder;
  double chanceOfWindy;

  WeatherChanceModel({
    required this.chanceOfFog,
    required this.chanceOfFrost,
    required this.chanceOfHighTemp,
    required this.chanceOfOvercast,
    required this.chanceOfRain,
    required this.chanceOfDry,
    required this.chanceOfSnow,
    required this.chanceOfSunshine,
    required this.chanceOfThunder,
    required this.chanceOfWindy,
  });

  factory WeatherChanceModel.fromHourly(List<WeatherHours> hourly) {
    double chanceOfFog = 0;
    double chanceOfFrost = 0;
    double chanceOfHighTemp = 0;
    double chanceOfOvercast = 0;
    double chanceOfRain = 0;
    double chanceOfDry = 0;
    double chanceOfSnow = 0;
    double chanceOfSunshine = 0;
    double chanceOfThunder = 0;
    double chanceOfWindy = 0;

    for (var value in hourly) {
      chanceOfFog += value.chanceOfFog;
      chanceOfFrost += value.chanceOfFrost;
      chanceOfHighTemp += value.chanceOfHighTemp;
      chanceOfOvercast += value.chanceOfOvercast;
      chanceOfRain += value.chanceOfRain;
      chanceOfDry += value.chanceOfDry;
      chanceOfSnow += value.chanceOfSnow;
      chanceOfSunshine += value.chanceOfSunshine;
      chanceOfThunder += value.chanceOfThunder;
      chanceOfWindy += value.chanceOfWindy;
    }

    chanceOfFog /= hourly.length;
    chanceOfFrost /= hourly.length;
    chanceOfHighTemp /= hourly.length;
    chanceOfOvercast /= hourly.length;
    chanceOfRain /= hourly.length;
    chanceOfDry /= hourly.length;
    chanceOfSnow /= hourly.length;
    chanceOfSunshine /= hourly.length;
    chanceOfThunder /= hourly.length;
    chanceOfWindy /= hourly.length;

    return WeatherChanceModel(
        chanceOfFog: chanceOfFog,
        chanceOfFrost: chanceOfFrost,
        chanceOfHighTemp: chanceOfHighTemp,
        chanceOfOvercast: chanceOfOvercast,
        chanceOfRain: chanceOfRain,
        chanceOfDry: chanceOfDry,
        chanceOfSnow: chanceOfSnow,
        chanceOfSunshine: chanceOfSunshine,
        chanceOfThunder: chanceOfThunder,
        chanceOfWindy: chanceOfWindy);
  }
}
