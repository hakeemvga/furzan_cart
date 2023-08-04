part of 'user_data_bloc.dart';

@immutable
abstract class UserDataEvent {}
class FetchUser extends UserDataEvent {
  final String email;
  final String password;
  FetchUser({required this.email,required this.password});
}