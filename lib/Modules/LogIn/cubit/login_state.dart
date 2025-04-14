part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final LogInModel login ;
  LoginSuccess (this.login);
}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
class LoginChangePasswordVisibility extends LoginState {}

