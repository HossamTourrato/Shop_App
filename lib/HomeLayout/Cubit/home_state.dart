part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class CurrentIndexBottomNavState extends HomeState {}
class HomeDataLoadingState extends HomeState {}
class HomeDataSuccessState extends HomeState {}
class HomeDataErrorState extends HomeState {}

