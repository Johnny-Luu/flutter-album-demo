import 'package:album_demo/presentation/base/theme/app_theme.dart';
import 'package:album_demo/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:album_demo/injection_container.dart' as di;
import 'package:album_demo/presentation/features/home/view/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'presentation/features/theme_wrapper/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl.allReady();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => sl<ThemeCubit>()),
        BlocProvider<HomeBloc>(create: (_) => sl<HomeBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: AppTheme.themeData(true, context),
            theme: AppTheme.themeData(false, context),
            themeMode: context.watch<ThemeCubit>().state.themeMode,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
