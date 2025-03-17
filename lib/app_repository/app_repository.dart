import 'package:ai_chat_room/data/remote/api_helper.dart';
import 'package:ai_chat_room/data/remote/urls.dart';

class AppRepository {
  ApiHelper apiHelper;
  AppRepository({required this.apiHelper});

  Future<dynamic> loginUser({required Map<String, dynamic> bodyParams}) async {
    return await apiHelper.getApi(url: AppUrls.BASE_URL_DEV,bodyParams: bodyParams);
  }

}