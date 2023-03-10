import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:news_app/app/data/endpoint.dart';
import 'package:news_app/app/routes/app_pages.dart';
import '../controllers/detailportal_controller.dart';

class DetailportalView extends GetView<DetailportalController> {
  DetailportalView({Key? key}) : super(key: key);
  Endpoints data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.name}'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child:
              // final rnd = Random();
              // final r = rnd.nextInt(220);
              // final g = rnd.nextInt(220);
              // final b = rnd.nextInt(220);
              // Color color = Color.fromARGB(255, r, g, b);

              ListView.builder(
            itemCount: data.paths?.length,
            itemBuilder: (context, index) {
              final title = data.paths![index];
              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.LIST_ARTICLE, arguments: title);
                },
                leading: Text("${index + 1}"),
                title: Text("${title.name!.toUpperCase()}"),
              );
            },
          )),
    );
  }
}
