part of 'password_bloc.dart';

@immutable
abstract class PasswordState {}

class PasswordInitial extends PasswordState {}
class PasswordLoading extends PasswordState {}
class PasswordLoaded extends PasswordState {}
class PasswordError extends PasswordState{}