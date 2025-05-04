import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/Models/home_products_model.dart';
import 'package:shop_app/Shared/Network/end_points.dart';
import 'package:shop_app/Shared/Network/remote/dio_helper.dart';

import '../../Modules/Categories/categories_screen.dart';
import '../../Modules/Favourite/fav_screen.dart';
import '../../Modules/Home/homeProducts_screen.dart';
import '../../Modules/Settings/settings_screen.dart';
import '../../Shared/const.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get (context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomNav  = [
    HomeProductsScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
     SettingScreen(),
  ];

  HomeModel ? homeModel;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(CurrentIndexBottomNavState());
  }

  void getHomeData() {
    emit(HomeDataLoadingState());

    DioHelper.getData(url: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print('this isssssssss ${homeModel?.data?.banners[0].image}');
      emit(HomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeDataErrorState());
    });

  }



}
