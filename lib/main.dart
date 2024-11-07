import 'package:bmi_calculator/core/themeData.dart';
import 'package:bmi_calculator/features/bloc/theme_bloc.dart';
import 'package:bmi_calculator/features/bloc/theme_state.dart';
import 'package:bmi_calculator/features/home/bloc/bmi_bloc.dart';
import 'package:bmi_calculator/features/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CalculateBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.isDarkMode ? darkTheme : lightTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
