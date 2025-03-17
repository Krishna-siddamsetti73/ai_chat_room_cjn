abstract class LoginUserEvent{}

class LoginUser extends LoginUserEvent{
  Map<String,dynamic> mParams;
  LoginUser({required this.mParams});
}