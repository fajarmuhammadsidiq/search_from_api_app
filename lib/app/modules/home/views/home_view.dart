import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:news_app/app/modules/const/randomcolor.dart';
import 'package:news_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final color1 = RandomColor();
    final controller = Get.find<HomeController>();
    Future refreshData() async {
      await Future.delayed(Duration(seconds: 2));
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('ListBerita'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView(children: [
            TextField(),
            SizedBox(height: 20),
            FutureBuilder(
              future: controller.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.endpoints!.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data1 = snapshot.data!.endpoints![index];
                        final data0 = snapshot.data!.endpoints![index].paths;
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILPORTAL, arguments: data1);
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: Get.width,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: color1.colors(),
                                  borderRadius: BorderRadius.circular(20)),
                              alignment: Alignment.center,
                              child: Text(
                                "${data1.name!.toUpperCase()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        );
                      },
                    ),
                  );
                  // return GridView.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 5,
                  //       mainAxisSpacing: 5),
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: snapshot.data!.endpoints!.length,
                  //   itemBuilder: (context, index) {
                  //     final data = snapshot.data!.endpoints![index];
                  //     return ListTile(
                  //       leading: Text("${index + 1}"),
                  //       title: Text("${data.name}"),
                  //     );
                  //   },
                  // );
                }
              },
            )
          ]),
        ));
  }
}
