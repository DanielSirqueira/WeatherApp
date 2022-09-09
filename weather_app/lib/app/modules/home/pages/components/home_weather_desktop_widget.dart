// ignore_for_file: no_logic_in_create_state, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weather/domain/entities/city.dart';
import 'package:weather/domain/entities/city_weather.dart';
import 'package:weather/infra/models/weather_chance_model.dart';
import 'package:weather_app/app/modules/home/bloc/search_weather_bloc.dart';
import 'package:weather_app/app/modules/home/events/search_weather_event.dart';
import 'package:weather_app/app/modules/home/pages/components/card_weather_next_day_widget.dart';
import 'package:weather_app/app/modules/home/pages/components/loading_widget.dart';
import 'package:weather_app/app/modules/home/pages/components/weather_temp_widget.dart';
import 'package:weather_app/app/modules/home/state/weather_state.dart';
import 'package:weather_app/app/modules/home/utils/weather_util.dart';
import 'package:weather_app/app/utils/weather_image.dart';

class HomeWeatherDesktopWidget extends StatefulWidget {
  final SearchWeatherBloc bloc;

  const HomeWeatherDesktopWidget({
    super.key,
    required this.bloc,
  });

  @override
  State<HomeWeatherDesktopWidget> createState() =>
      _HomWeatherDesktopWidgetState(bloc);
}

class _HomWeatherDesktopWidgetState extends State<HomeWeatherDesktopWidget> {
  final SearchWeatherBloc bloc;
  _HomWeatherDesktopWidgetState(this.bloc);

  TextEditingController? cityTextController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    var state = bloc.state;

    if (state is SearchWeatherLoadgin) {
      widget = const LoadingWidget();
    }

    if (state is SearchWeatherError) {
      widget = Container();
    }

    if (state is SearchWeatherSuccess) {
      widget = WeatherMobileWidget(
        weather: state.data,
        city: state.city,
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Container(
          width: 500,
          child: SizedBox(
            height: 50,
            child: TextFormField(
              controller: cityTextController,
              onFieldSubmitted: (value) {
                if (value != null && value.isNotEmpty) {
                  var city = City(
                      name: value,
                      latitude: 0,
                      longitude: 0,
                      country: '',
                      state: '');
                  bloc.add(GetWeatherEvent(city));
                }
              },
              onChanged: (value) {
                cityTextController!.text = value;
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Pesquisar',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: widget,
    );
  }
}

class WeatherMobileWidget extends StatelessWidget {
  final CityWeather weather;
  final City city;

  const WeatherMobileWidget({
    Key? key,
    required this.weather,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: SizedBox(
            width: size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 400,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                                top: 240,
                                child: Stack(
                                  children: [
                                    WeatherTempWidget(
                                      temp:
                                          '${weather.currentConditions[0].temp}',
                                      sizeTemp: 120,
                                      sizeDegrees: 44,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
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
                              top: 355,
                              child: Text(
                                weather.currentConditions[0].typeWeather
                                    .description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                                style: GoogleFonts.rubik(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 300,
                              child: Image.asset(
                                WeatherImage(WeatherImage.SIZE_512)
                                    .getCodeWeather(weather
                                        .currentConditions[0].typeWeather.code),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          city != null
                              ? Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.location_pin),
                                      Text(
                                        city.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 20),
                          InfoWeather(
                            chance: WeatherChanceModel.fromHourly(
                                weather.weather[1].hourly),
                            uvIndex: weather.currentConditions[0].uvIndex,
                            windSpeedKm:
                                weather.currentConditions[0].windSpeedKm,
                            humidity: weather.currentConditions[0].humidity,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CardWeatherNextDayWidget(
                            weather: weather.weather[1])),
                    const SizedBox(width: 20),
                    Expanded(
                        child: CardWeatherNextDayWidget(
                            weather: weather.weather[2])),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class InfoWeather extends StatelessWidget {
  final WeatherChanceModel chance;
  final int uvIndex;
  final int windSpeedKm;
  final int humidity;
  const InfoWeather(
      {super.key,
      required this.chance,
      required this.uvIndex,
      required this.windSpeedKm,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat('###.#', 'pt_BR');
    return Column(
      children: [
        InfoWeatherWidget(
          title: 'Índice UV',
          value: getUVIndex(uvIndex),
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.wb_sunny_outlined,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Vento',
          value: '$windSpeedKm km/h',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.wind_power_rounded,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Umidade',
          value: '$humidity%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.water_drop_rounded,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de sol',
          value: '${format.format(chance.chanceOfSnow)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.sunny,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de está seco',
          value: '${format.format(chance.chanceOfDry)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.sunny,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de alta temperatura',
          value: '${format.format(chance.chanceOfHighTemp)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.sunny,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de está nublado',
          value: '${format.format(chance.chanceOfOvercast)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.cloud,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de chuva',
          value: '${format.format(chance.chanceOfRain)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.cloudy_snowing,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de trovoadas',
          value: '${format.format(chance.chanceOfThunder)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.thunderstorm_rounded,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de ventos',
          value: '${format.format(chance.chanceOfWindy)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.wind_power_rounded,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de neblina',
          value: '${format.format(chance.chanceOfFog)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.foggy,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        InfoWeatherWidget(
          title: 'Chance de granizo',
          value: '${format.format(chance.chanceOfFrost)}%',
          sizeTitle: 12,
          sizeValue: 12,
          icon: const Icon(
            Icons.cloudy_snowing,
            size: 16,
          ),
        ),
        const SizedBox(height: 20),
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
      padding: const EdgeInsets.all(8),
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
                  fontSize: sizeTitle,
                ),
              )
            ],
          ),
          Text(
            value,
            style: GoogleFonts.rubik(
                fontSize: sizeValue, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
