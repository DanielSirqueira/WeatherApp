// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/domain/entities/city.dart';
import 'package:weather_app/app/modules/home/bloc/search_city_bloc.dart';
import 'package:weather_app/app/modules/home/bloc/search_weather_bloc.dart';
import 'package:weather_app/app/modules/home/events/search_weather_event.dart';
import 'package:weather_app/app/modules/home/pages/components/home_weather_desktop_widget.dart';

import 'package:weather_app/app/modules/home/pages/components/home_weather_mobile_widget.dart';
import 'package:weather_app/app/modules/home/state/weather_state.dart';
import 'package:weather_app/app/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = Modular.get<SearchWeatherBloc>();
  @override
  void initState() {
    super.initState();

    bloc.stream.listen((event) {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.add(GetGeolocationWeatherEvent());
    });
  }

  @override
  void dispose() {
    bloc.close();
    Modular.get<SearchCityBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeWeatherMobileWidget(bloc: bloc),
          desktop: HomeWeatherDesktopWidget(bloc: bloc),
        ),
      ),
    );
  }
}
