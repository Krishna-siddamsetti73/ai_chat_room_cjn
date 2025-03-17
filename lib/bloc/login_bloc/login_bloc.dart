import 'package:ai_chat_room/app_repository/app_repository.dart';
import 'package:ai_chat_room/bloc/login_bloc/login_event.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
dart:convert';

import 'login_state.dart';

class LoginBloc extends Bloc<LoginUserEvent, LoginUserState> {
  AppRepository appRepository;
  LoginBloc({required this.appRepository}) : super(LoginInitialState()) {
    on<LoginUser>((event, emit) async {
      emit(LoginLoadingState());
      try {
        var response = await appRepository.loginUser(bodyParams: event.mParams);
        
        if (response['responseStatus'] == "success") {
          var candidateData = response['responseMessage']['data'];
          String candidateId = event.mParams['candidate_id'];

          // Find candidate info
          Map<String, dynamic>? candidateInfo = candidateData.firstWhere(
            (candidate) => candidate["candidate_id"] == candidateId,
            orElse: () => {},
          );

          if (candidateInfo.isNotEmpty) {
            // Save candidate info in SharedPreferences
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('candidate_id', candidateId);
            await prefs.setString('candidateInfo', jsonEncode(candidateInfo));

            emit(LoginSuccessState());
          } else {
            emit(LoginErrorState(errorMsg: "Candidate not found"));
          }
        } else {
          emit(LoginErrorState(errorMsg: "Error: ${response['responseMessage']}"));
        }
      } catch (e) {
        emit(LoginErrorState(errorMsg: "Exception: $e"));
      }
    });
  }
}
