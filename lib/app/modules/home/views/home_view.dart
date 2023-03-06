import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/beritamodel.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeC = Get.find<HomeController>();
  TextEditingController searchController = TextEditingController();
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchString = value;
                });
              },
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
                child: FutureBuilder<BeritaModel>(
                    future: homeC.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView(
                          children: [
                            ListView.builder(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data!.posts!.length,
                              itemBuilder: (context, index) {
                                final snap = snapshot.data?.data?.posts?[index];
                                return snapshot.data!.data!.posts![index].title!
                                        .isCaseInsensitiveContains(searchString)
                                    ? Card(
                                        margin: EdgeInsets.all(10),
                                        color: Colors.blue,
                                        child: ListTile(
                                          leading: Text("${index + 1}"),
                                          title: Text("${snap!.title}"),
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                          ],
                        );
                      }
                    })),
          ]),
        ));
  }
}
