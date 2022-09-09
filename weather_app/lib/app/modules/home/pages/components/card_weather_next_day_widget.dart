import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weather/domain/entities/weather.dart';
import 'package:weather_app/app/modules/home/pages/components/weather_temp_widget.dart';
import 'package:weather/infra/models/weather_chance_model.dart';

import '../../../../utils/weather_image.dart';
import '../../utils/weather_util.dart';

class CardWeatherNextDayWidget extends StatelessWidget {
  final Weather weather;
  const CardWeatherNextDayWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var chance = WeatherChanceModel.fromHourly(weather.hourly);
    var format = NumberFormat('###.#', 'pt_BR');

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, left: 12, right: 12),
          padding: const EdgeInsets.all(20),
          width: size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  WeatherTempWidget(
                    temp: '${weather.maxTemp}',
                    sizeTemp: 44,
                    sizeDegrees: 32,
                  ),
                  WeatherTempWidget(
                    temp: '${weather.minTemp}',
                    sizeTemp: 44,
                    sizeDegrees: 32,
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy').format(weather.date),
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ChanceWidget(
                        title: 'Índece UV',
                        value: getUVIndex(weather.uvIndex),
                      ),
                      ChanceWidget(
                        title: 'Sol',
                        value: '${format.format(chance.chanceOfSnow)}%',
                      ),
                      ChanceWidget(
                        title: 'Seco',
                        value: '${format.format(chance.chanceOfDry)}%',
                      ),
                      ChanceWidget(
                        title: 'Alta temperatura',
                        value: '${format.format(chance.chanceOfHighTemp)}%',
                      ),
                      ChanceWidget(
                        title: 'Nublado',
                        value: '${format.format(chance.chanceOfOvercast)}%',
                      ),
                      ChanceWidget(
                        title: 'Chuva',
                        value: '${format.format(chance.chanceOfRain)}%',
                      ),
                      ChanceWidget(
                        title: 'Trovão',
                        value: '${format.format(chance.chanceOfThunder)}%',
                      ),
                      ChanceWidget(
                        title: 'Vento',
                        value: '${format.format(chance.chanceOfWindy)}%',
                      ),
                      ChanceWidget(
                        title: 'neblina',
                        value: '${format.format(chance.chanceOfFog)}%',
                      ),
                      ChanceWidget(
                        title: 'granizo',
                        value: '${format.format(chance.chanceOfFrost)}%',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            WeatherImage(WeatherImage.SIZE_512).getCodeWeather(
                weather.hourly[7].typeWeather.code,
                night: false),
          ),
        ),
      ],
    );
  }
}

class ChanceWidget extends StatelessWidget {
  final String title;
  final String value;

  const ChanceWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: GoogleFonts.rubik(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: GoogleFonts.rubik(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
