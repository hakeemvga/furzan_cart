part of 'user_data_bloc.dart';

@immutable
abstract class UserDataState {}

class UserDataInitial extends UserDataState {}
class UserDataLoading extends UserDataState {}
class UserDataLoaded extends UserDataState {}
class UserDataError extends UserDataState{}