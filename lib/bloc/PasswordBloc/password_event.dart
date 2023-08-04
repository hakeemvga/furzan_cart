part of 'password_bloc.dart';

@immutable
abstract class PasswordEvent {}
class FetchPassword extends PasswordEvent {

  final String oldPassword;
  final String newPassword;
  FetchPassword({required this.oldPassword,required this.newPassword});
}