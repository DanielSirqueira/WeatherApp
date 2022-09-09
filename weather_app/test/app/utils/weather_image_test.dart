import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/utils/weather_image.dart';

void main() {
  testWidgets('Verificando os caminhos do objeto WeatherImage', (tester) async {
    expect(WeatherImage().getCodeWeather(113),
        'assets/images/code-weather/50/113-s.png');

    expect(WeatherImage(WeatherImage.SIZE_100).getCodeWeather(113),
        'assets/images/code-weather/100/113-s.png');

    expect(WeatherImage(WeatherImage.SIZE_512).getCodeWeather(113),
        'assets/images/code-weather/512/113-s.png');
  });
}
