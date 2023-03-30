import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  void updateAppTheme(bool isDarkTheme) {
    emit(ThemeState(themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light));
  }
}
