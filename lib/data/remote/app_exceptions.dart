class AppException implements Exception {
  String title;
  String message;
  AppException({required this.title, required this.message});

  String toErrorMsg(){
    return '$title: $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String errorMsg}) : super(title: "Network Error: ", message: errorMsg);
}

class BadRequestException extends AppException {
  BadRequestException({required String errorMsg}) : super(title: "Invalid Request: ", message: errorMsg);
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required String errorMsg}) : super(title: "Unauthorized: ", message: errorMsg);
}

class InvalidInputException extends AppException {
  InvalidInputException({required String errorMsg}) : super(title: "Invalid Input: ", message: errorMsg);
}