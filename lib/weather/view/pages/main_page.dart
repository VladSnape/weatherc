import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherc/weather/domain/model/weather_model.dart';
import 'package:weatherc/weather/view/bloc/cubit/get_weather_cubit_cubit.dart';
import 'package:weatherc/weather/view/widget/mycontainer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  TextEditingController cityController = TextEditingController();
  int selectedListItem = 0; // To keep track of the selected item index.

  @override
  Widget build(BuildContext context) {
    const Color transparentColor = Colors.transparent;

    ThemeData theme = Theme.of(context);

    return BlocBuilder<GetWeatherCubitCubit, GetWeatherCubitState>(
      builder: (context, state) {
        if (state is GetWeatherCubitInitial) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        BlocProvider.of<GetWeatherCubitCubit>(context)
                            .getWeather(city: cityController.text);
                        cityController.clear();
                      }
                    },
                    icon: const Icon(Icons.search))
              ],
              centerTitle: true,
              title: TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    hintText: 'enter a city ',
                  )),
            ),
            body: const Center(
              child: Text('no city enetred '),
            ),
          );
        } else if (state is GetWeatherCubitFailed) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        BlocProvider.of<GetWeatherCubitCubit>(context)
                            .getWeather(city: cityController.text);
                        cityController.clear();
                      }
                    },
                    icon: const Icon(Icons.search))
              ],
              centerTitle: true,
              title: TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    hintText: 'enter a city ',
                  )),
            ),
            body: const Center(
              child: Text('no city with such name h '),
            ),
          );
        } else if (state is GetWeatherCubitLaoding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWeatherCubitSuccess) {
          WeatherModel weatherModel = state.weatherModel;
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        BlocProvider.of<GetWeatherCubitCubit>(context)
                            .getWeather(city: cityController.text);
                        cityController.clear();
                      }
                    },
                    icon: const Icon(Icons.search))
              ],
              centerTitle: true,
              title: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    hintText: '${weatherModel.location!.name}',
                  )),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MyContainer(
                    height: 0.45,
                    color: transparentColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${weatherModel.current!.tempC}°c',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          '${weatherModel.current!.condition!.text}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${weatherModel.forecast!.forecastday![0].date}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyContainer(
                    height: 0.2,
                    color: Theme.of(context).primaryColor,
                    widget: HourList(
                      hour: weatherModel.forecast!.forecastday![0].hour!,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          weatherModel.forecast!.forecastday![0].hour!.length,
                      width: MediaQuery.of(context).size.width * 0.25,
                      selectedListItem: selectedListItem,
                      onItemTap: (index) {
                        setState(() {
                          selectedListItem = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyContainer(
                    height: 0.2,
                    color: theme.primaryColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sunrize',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '${weatherModel.forecast!.forecastday![0].astro!.sunrise}',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Sunset', style: theme.textTheme.bodyMedium),
                              Text(
                                '${weatherModel.forecast!.forecastday![0].astro!.sunset}',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyContainer(
                    height: 0.2,
                    color: theme.primaryColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'moonrise',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '${weatherModel.forecast!.forecastday![0].astro!.sunrise}',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'moonset',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '${weatherModel.forecast!.forecastday![0].astro!.moonset}',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyContainer(
                    height: 0.2,
                    color: theme.primaryColor,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'cloud cover',
                                style: theme.textTheme.labelSmall,
                              ),
                              Text(
                                '${weatherModel.current!.cloud}',
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'pressure',
                                style: theme.textTheme.labelSmall,
                              ),
                              Text(
                                '${weatherModel.current!.pressureIn}',
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'win speed',
                                style: theme.textTheme.labelSmall,
                              ),
                              Text(
                                '${weatherModel.current!.windKph} km/h',
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        Forecastday forecastday =
                            weatherModel.forecast!.forecastday![index];
                        return Container(
                          color: theme.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${forecastday.date}',
                                  style: theme.textTheme.labelSmall,
                                ),
                                Text(
                                  '${forecastday.day!.condition!.text}',
                                  style: theme.textTheme.labelSmall,
                                ),
                                Text(
                                  '${forecastday.day!.avgtempC}',
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }
        return const Text('no clue what state you in');
      },
    );
  }
}

class HourList extends StatelessWidget {
  final List<Hour> hour;

  final Axis scrollDirection;
  final int itemCount;
  final double width;
  final int selectedListItem; // Selected item index.
  final ValueChanged<int> onItemTap;

  const HourList({
    Key? key,
    required this.scrollDirection,
    required this.itemCount,
    required this.width,
    required this.selectedListItem,
    required this.onItemTap,
    required this.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final isSelected = index == selectedListItem;

        return GestureDetector(
          onTap: () {
            onItemTap(index); // Notify parent when item is tapped.
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected
                    ? const Color.fromARGB(255, 186, 161, 255)
                    : Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    formatHourMinute(hour[index].time!),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    child: Center(
                      child: Text(
                        '${hour[index].condition!.text}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Text(
                    '${hour[index].tempC}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

String formatHourMinute(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime =
      "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}
