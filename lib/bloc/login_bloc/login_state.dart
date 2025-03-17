abstract class LoginUserState{}

class LoginInitialState extends LoginUserState{}

class LoginLoadingState extends LoginUserState{}

class LoginSuccessState extends LoginUserState{}

class LoginErrorState extends LoginUserState{
  String errorMsg;
  LoginErrorState({required this.errorMsg});

}