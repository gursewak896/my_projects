import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkMode: false)) {
    on<TogglePressedEvent>((event, emit) async {
      final newThemeState = !state.isDarkMode;
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isDarkMode', newThemeState);
      emit(state.copyWith(isDarkMode: newThemeState));
    });
  }
}
