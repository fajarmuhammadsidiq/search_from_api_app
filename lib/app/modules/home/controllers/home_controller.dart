import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:news_app/app/data/beritamodel.dart';
import 'package:news_app/app/data/endpoint.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  Future<AllModel> getData() async {
    var url = "https://api-berita-indonesia.vercel.app/";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      print("HIT API BERHASIL");
      print(data);
    } else {
      print("HIT API GAGAL");
    }
    return AllModel.fromJson(data);
  }
}
