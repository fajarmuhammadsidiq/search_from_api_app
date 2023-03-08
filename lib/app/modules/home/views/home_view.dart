import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
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
        appBar: AppBar(
          title: const Text('HomeView'),
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
                  return GridView.custom(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(2, 2),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: snapshot.data?.endpoints?.length,
                        (context, index) {
                      final data = snapshot.data!.endpoints![index];
                      final rnd = Random();
                      final r = rnd.nextInt(240) * 240;
                      final g = rnd.nextInt(240) * 240;
                      final b = rnd.nextInt(240) * 240;
                      Color color = Color.fromARGB(255, r, g, b);
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          color: color,
                          child: Text("${data.name}"),
                        ),
                      );
                    }),
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
