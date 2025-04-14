import 'package:shop_app/Models/user_model.dart';

class LogInModel {
  bool? status;
  String? message;
  UserDataModel? data;
  // LogInModel({
  //   this.status,
  //   this.message,
  //   this.data,
  // });
  LogInModel.fromJson (Map<String,dynamic> json){

     status = json['status'];
     message = json['message'];
     data= json['data'] != null ? UserDataModel.fromJson(json['data']) : null;

  }
}
