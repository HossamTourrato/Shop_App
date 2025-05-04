import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/HomeLayout/Cubit/home_cubit.dart';
import 'package:shop_app/HomeLayout/shopApp_layout.dart';
import 'package:shop_app/Modules/OnBoarding/onBoarding_screen.dart';
import 'package:shop_app/Modules/LogIn/logIn_screen.dart';
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
    return BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              home:  HomeLayout(),
            );
          },
        )
    );
  }
}


