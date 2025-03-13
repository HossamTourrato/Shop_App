import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Shared/Network/end_points.dart';
import '../../../Shared/Network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;


  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    emit(LoginLoading());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then(
            (value){
              print(value);
              emit(LoginSuccess());
              // if(value.data['status']){
              //   emit(LoginSuccess());
              // }else{
              //   emit(LoginFailure(value.data['message']));
              // }
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
