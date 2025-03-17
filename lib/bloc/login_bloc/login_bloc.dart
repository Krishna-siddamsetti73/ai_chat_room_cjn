import 'package:ai_chat_room/app_repository/app_repository.dart';
import 'package:ai_chat_room/bloc/login_bloc/login_event.dart';
import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/data/remote/urls.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'login_state.dart';

class LoginBloc extends Bloc<LoginUserEvent, LoginUserState> {
  AppRepository appRepository;
  LoginBloc({required this.appRepository}) : super(LoginInitialState()) {
    on<LoginUser>((event, emit) async{
      emit(LoginLoadingState());
      try{

        var mData = await appRepository.loginUser(bodyParams: event.mParams);
        if(mData['responseStatus'] == "success"){
          emit(LoginSuccessState());
        }else{
          emit(LoginErrorState(errorMsg: "Error"));
        }
      }catch (e){
        emit(LoginErrorState(errorMsg: e.toString()));
      }
      emit(LoginSuccessState());
    });
  }
}
