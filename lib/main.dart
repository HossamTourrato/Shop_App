import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/Modules/OnBoarding/onBoarding_screen.dart';
import 'Shared/Network/remote/dio_helper.dart';
import 'Shared/Styles/Theme/Dark.dart';
import 'Shared/Styles/Theme/Light.dart';
import 'Shared/bloc_observer.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme ,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen() ,

    );
  }
}


