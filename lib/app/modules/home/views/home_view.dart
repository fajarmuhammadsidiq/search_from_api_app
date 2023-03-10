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
    final controller = Get.find<HomeController>();
    Future refreshData() async {
      await Future.delayed(Duration(seconds: 2));
      setState(() {});
    }

    return Scaffold(
        drawer: Drawer(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: Get.width,
                  height: 300,
                  color: Colors.teal,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75.0),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(360 / 2)),
                        ),
                      ),
                      Text("fajar")
                    ],
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Akun")),
                    ElevatedButton(onPressed: () {}, child: Text("Favorite")),
                    ElevatedButton(onPressed: () {}, child: Text("Keluar")),
                  ],
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text('Portal Berita'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView(children: [
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
                        final rnd = Random();
                        final r = rnd.nextInt(220);
                        final g = rnd.nextInt(220);
                        final b = rnd.nextInt(220);
                        Color color = Color.fromARGB(255, r, g, b);
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILPORTAL, arguments: data1);
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: Get.width,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: color,
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
