import 'dart:convert';



import 'package:furzan_app/repository/api/user_api/api_client.dart';
import 'package:furzan_app/repository/model_class/UserModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';







class UserApi {
  ApiClient apiClient = ApiClient();


  Future<UserModel> fetchUserData(String email,String password) async {
    String trendingpath = '/auth/local/shop/login';
    var body = {
      "email":email,
      'password':password,
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return UserModel.fromJson(jsonDecode(response.body));
  }
   updatePassword(String oldPassword,String newPassword) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    String id=prefs.getString("Id").toString();
    String trendingpath ='/shop/reset-password/$id';
    var body = {
     "oldPassword":oldPassword,
      "newPassword":newPassword,
    };
    await apiClient.invokeAPI(trendingpath, 'PATCH', body);

  }
}