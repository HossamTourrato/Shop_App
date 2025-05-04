import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../HomeLayout/shopApp_layout.dart';
import '../../../Models/login_model.dart';
import '../../../Shared/Components/components.dart';
import '../../../Shared/Network/end_points.dart';
import '../../../Shared/Network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  LogInModel? loginModel;


  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({required String email, required String password, required context}) {
    emit(LoginLoading());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then(
            (value){
               print(value.data);
               loginModel = LogInModel.fromJson(value.data);
               emit(LoginSuccess(loginModel!));
               navigatePushAndFinish(context,HomeLayout());

            }).catchError((error) {
              print(error.toString());
              emit(LoginFailure(error.toString()));
    });

  }
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangePasswordVisibility());
  }
}
