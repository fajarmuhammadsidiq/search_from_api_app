import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:news_app/app/data/endpoint.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controllers/detailportal_controller.dart';

class DetailportalView extends GetView<DetailportalController> {
  const DetailportalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Endpoints data = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailportalView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.custom(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 2),
                QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                childCount: data.paths?.length, (context, index) {
              final rnd = Random();
              final r = rnd.nextInt(220);
              final g = rnd.nextInt(220);
              final b = rnd.nextInt(220);
              Color color = Color.fromARGB(255, r, g, b);
              return Container(
                alignment: Alignment.center,
                color: color,
                child: Text(
                  "${data.paths![index].name!.toUpperCase()}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            }),
          ),
        ));
  }
}
