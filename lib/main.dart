import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app_using_privider/cubit/cubit/quizz_cubit.dart';
import 'package:quizz_app_using_privider/provider/theme_manager_provider.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_using_privider/view/home_page.dart';

void main() {
  // runApp(const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizzCubit>(
      create: (context) => QuizzCubit(),
      child: ChangeNotifierProvider(
        create: ((context) => ThemeManagerProvider()),
        child: Consumer<ThemeManagerProvider>(
          builder: (context, themeManager, child) {
            return MaterialApp(
              title: 'Quizz App',
              theme: themeManager.getTheme(),
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}
