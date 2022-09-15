import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/domain/errors/error.dart';
import 'package:weather_app/app/modules/home/bloc/search_city_bloc.dart';
import 'package:weather_app/app/modules/home/events/search_city_event.dart';
import 'package:weather_app/app/modules/home/state/search_city_state.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final bloc = Modular.get<SearchCityBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 32,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(null),
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: TextField(
          onChanged: (value) => bloc.add(SearchListCityEvent(value)),
          autofocus: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Pesquisar',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<SearchCityBloc, SearchCityState>(
              bloc: bloc,
              builder: (_, state) {
                if (state is SearchCityStart) {
                  return const Center(
                    child: Text("Insira um nome de localização."),
                  );
                }

                if (state is SearchCityError) {
                  if (state.error is InvalidTextError) {
                    return const Center(
                      child: Text("Insira um nome de localização."),
                    );
                  }

                  return const Center(
                    child: Text("Houve um error."),
                  );
                }

                if (state is SearchCityLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final list = (state as SearchCitySuccess).citys;

                return ListView.builder(
                  itemCount: list.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (_, id) {
                    final city = list[id];
                    return AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(city.name),
                        subtitle: Text('${city.state}, ${city.country}'),
                        onTap: () {
                          Navigator.of(context).pop(city);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
