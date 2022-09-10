// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/infra/models/weather_chance_model.dart';
import 'package:weather_app/app/modules/home/bloc/search_weather_bloc.dart';
import 'package:weather_app/app/modules/home/pages/components/card_weather_next_day_widget.dart';
import 'package:weather_app/app/modules/home/pages/components/loading_widget.dart';
import 'package:weather_app/app/modules/home/events/search_weather_event.dart';
import 'package:weather_app/app/modules/home/pages/components/weather_temp_widget.dart';
import 'package:weather_app/app/modules/home/state/weather_state.dart';
import 'package:weather_app/app/modules/home/utils/weather_util.dart';
import 'package:weather_app/app/utils/weather_image.dart';
import 'package:intl/intl.dart';

class HomeWeatherMobileWidget extends StatefulWidget {
  final SearchWeatherBloc bloc;

  const HomeWeatherMobileWidget({
    super.key,
    required this.bloc,
  });

  @override
  State<HomeWeatherMobileWidget> createState() =>
      _HomWeatherMobileWidgetState(bloc);
}

class _HomWeatherMobileWidgetState extends State<HomeWeatherMobileWidget> {
  final SearchWeatherBloc bloc;

  _HomWeatherMobileWidgetState(this.bloc);

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    var state = bloc.state;
    City? city;

    if (state is SearchWeatherLoadgin) {
      widget = const LoadingWidget();
    }

    if (state is SearchWeatherError) {
      widget = Center(
        child: Text('Ocorreu um erro no servidor: ${state.error}'),
      );
    }

    if (state is SearchWeatherSuccess) {
      city = state.city;
      widget = WeatherMobileWidget(weather: state.data);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: city != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.location_pin),
                  Text(
                    city.name,
                    style: GoogleFonts.rubik(),
                  ),
                ],
              )
            : Container(),
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () async {
              var result =
                  await Navigator.of(context).pushNamed<City?>('/search-city');
              if (result != null) {
                bloc.add(GetWeatherEvent(result));
              }
            },
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: widget,
    );
  }
}

class WeatherMobileWidget extends StatelessWidget {
  final CityWeather weather;

  const WeatherMobileWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chance = WeatherChanceModel.fromHourly(weather.weather[1].hourly);
    var format = NumberFormat('###.#', 'pt_BR');

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                  top: 165,
                  child: Stack(
                    children: [
                      WeatherTempWidget(
                        temp: '${weather.currentConditions[0].temp}',
                        sizeTemp: 120,
                        sizeDegrees: 44,
                      ),
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.background,
                              spreadRadius: 5,
                              blurRadius: 25,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Positioned(
                top: 300,
                child: Text(
                  weather.currentConditions[0].typeWeather.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: GoogleFonts.rubik(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 220,
                height: 220,
                child: Image.asset(
                  WeatherImage(WeatherImage.SIZE_512).getCodeWeather(
                      weather.currentConditions[0].typeWeather.code),
                ),
              ),
            ],
          ),
        ),
        InfoWeatherWidget(
          title: 'Índice UV',
          value: getUVIndex(weather.currentConditions[0].uvIndex),
          icon: const Icon(
            Icons.wb_sunny_outlined,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Vento',
          value: '${weather.currentConditions[0].windSpeedKm} km/h',
          icon: const Icon(
            Icons.wind_power_rounded,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Umidade',
          value: '${weather.currentConditions[0].humidity}%',
          icon: const Icon(
            Icons.water_drop_rounded,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de sol',
          value: '${format.format(chance.chanceOfSnow)}%',
          icon: const Icon(
            Icons.sunny,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de está seco',
          value: '${format.format(chance.chanceOfDry)}%',
          icon: const Icon(
            Icons.sunny,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de alta temperatura',
          value: '${format.format(chance.chanceOfHighTemp)}%',
          icon: const Icon(
            Icons.sunny,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de está nublado',
          value: '${format.format(chance.chanceOfOvercast)}%',
          icon: const Icon(
            Icons.cloud,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de chuva',
          value: '${format.format(chance.chanceOfRain)}%',
          icon: const Icon(
            Icons.cloudy_snowing,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de trovoadas',
          value: '${format.format(chance.chanceOfThunder)}%',
          icon: const Icon(
            Icons.thunderstorm_rounded,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de ventos',
          value: '${format.format(chance.chanceOfWindy)}%',
          icon: const Icon(
            Icons.wind_power_rounded,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de neblina',
          value: '${format.format(chance.chanceOfFog)}%',
          icon: const Icon(
            Icons.foggy,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de granizo',
          value: '${format.format(chance.chanceOfFrost)}%',
          icon: const Icon(
            Icons.cloudy_snowing,
          ),
        ),
        const SizedBox(height: 20),
        CardWeatherNextDayWidget(weather: weather.weather[1]),
        const SizedBox(height: 20),
        CardWeatherNextDayWidget(weather: weather.weather[2]),
      ],
    );
  }
}

class InfoWeatherWidget extends StatelessWidget {
  final String title;
  final String value;
  final double sizeTitle;
  final double sizeValue;
  final Icon icon;

  const InfoWeatherWidget({
    Key? key,
    required this.title,
    required this.value,
    this.sizeTitle = 16,
    this.sizeValue = 16,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                ),
              )
            ],
          ),
          Text(
            value,
            style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
