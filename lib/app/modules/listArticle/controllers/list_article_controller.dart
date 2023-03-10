import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/beritamodel.dart';
import '../../../data/endpoint.dart';

class ListArticleController extends GetxController {
  //TODO: Implement ListArticleController

  Future<BeritaModel> getData(String path) async {
    var url = "${path}";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      print("HIT API BERHASIL");
    } else {
      print("HIT API GAGAL");
    }
    return BeritaModel.fromJson(data);
  }
}
