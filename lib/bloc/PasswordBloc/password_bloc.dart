import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:furzan_app/repository/api/user_api/user_api.dart';
import 'package:meta/meta.dart';



part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {


  UserApi userApi=UserApi();


  PasswordBloc() : super(PasswordInitial()) {
    on<FetchPassword>((event, emit)async {
    emit(PasswordLoading());
    try{
     await userApi.updatePassword( event.oldPassword, event.newPassword);
     emit(PasswordLoaded());
    }catch(e){
      print(e);
      emit(PasswordError());
    }
    });
  }
}
