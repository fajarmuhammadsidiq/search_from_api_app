import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../data/beritamodel.dart';

class AntaraController extends GetxController {
  //TODO: Implement AntaraController

  Future<BeritaModel> getData() async {
    const url = "https://api-berita-indonesia.vercel.app/antara/terbaru/";
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
