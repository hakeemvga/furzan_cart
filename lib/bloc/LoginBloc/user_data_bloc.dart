

import 'package:bloc/bloc.dart';

import 'package:furzan_app/repository/model_class/UserModel.dart';
import 'package:meta/meta.dart';

import '../../repository/api/user_api/user_api.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {

  late UserModel userModel;
  UserApi userApi=UserApi();

  UserDataBloc() : super(UserDataInitial()) {
    on<FetchUser>((event,emit) async {
      emit(UserDataLoading());
      try{
        userModel=await userApi.fetchUserData(event.email,event.password);
        emit(UserDataLoaded());
      }catch(e){
        print(e.toString());
        emit(UserDataError());
      }
    });
  }
}
