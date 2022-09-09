// ignore_for_file: constant_identifier_names

class WeatherImage {
  static const String SIZE_50 = '50';
  static const String SIZE_100 = '100';
  static const String SIZE_512 = '512';

  final String path = 'assets/images/code-weather';
  final String size;

  WeatherImage([this.size = '50']);

  String getCodeWeather(int code, {bool? night}) {
    if (night == null) {
      int hour = DateTime.now().hour;
      night = !(hour >= 6 && hour <= 18);
    }

    if ([113].contains(code)) {
      return '$path/$size/113-${night ? 'n' : 's'}.png';
    }

    if ([116].contains(code)) {
      return '$path/$size/116-${night ? 'n' : 's'}.png';
    }

    if ([119, 122, 260].contains(code)) {
      return '$path/$size/119.png';
    }

    if ([143].contains(code)) {
      return '$path/$size/143-${night ? 'n' : 's'}.png';
    }

    if ([176, 263, 266].contains(code)) {
      return '$path/$size/176-${night ? 'n' : 's'}.png';
    }

    if ([179, 293, 296, 299, 302, 353].contains(code)) {
      return '$path/$size/179.png';
    }

    if ([182, 317, 320].contains(code)) {
      return '$path/$size/182.png';
    }

    if ([185, 350, 362, 365, 374, 377].contains(code)) {
      return '$path/$size/185.png';
    }

    if ([200].contains(code)) {
      return '$path/$size/200.png';
    }

    if ([227, 230, 248, 323, 326, 329, 332, 335, 338, 368, 371]
        .contains(code)) {
      return '$path/$size/227.png';
    }

    if ([281, 284, 311, 314].contains(code)) {
      return '$path/$size/281.png';
    }

    if ([305, 308, 356, 359, 386, 389].contains(code)) {
      return '$path/$size/305.png';
    }

    if ([392, 395].contains(code)) {
      return '$path/$size/392.png';
    }

    return '$path/$size/113-s.png';
  }
}
