import 'dart:convert';



import 'package:furzan_app/repository/api/user_api/api_client.dart';
import 'package:furzan_app/repository/model_class/ProductModel.dart';
import 'package:furzan_app/repository/model_class/UserModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';







class ProductApi {
  ApiClient apiClient = ApiClient();


  Future<List<ProductModel>> fetchProducts() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String id= pref.getString("Id").toString();
    String trendingpath = '/product/all?shopId=$id';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ProductModel.listFromJson(jsonDecode(response.body));
  }

}