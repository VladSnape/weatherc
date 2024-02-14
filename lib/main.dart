import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherc/features/settings/cubit/settings_cubit.dart';
import 'package:weatherc/service_locator.dart';
import 'package:weatherc/weather/view/bloc/cubit/get_weather_cubit_cubit.dart';
import 'package:weatherc/weather/view/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<GetWeatherCubitCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<SettingsCubit>(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(theme: state.themeData, home: const HomePage());
        },
      ),
    );
  }
}
