import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/data/endpoint.dart';

import '../controllers/list_article_controller.dart';

class ListArticleView extends GetView<ListArticleController> {
  const ListArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Paths data = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('${data.name}'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: controller.getData(data.path.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.data?.posts?.length,
                itemBuilder: (context, index) {
                  return snapshot.data?.data?.posts?[index] == null
                      ? Container(
                          child: Center(
                            child: Text("data kosong"),
                          ),
                        )
                      : ListTile(
                          leading: Text("${index + 1}" == null
                              ? "Article belum ada"
                              : "${index + 1}"),
                          title: Text(
                              "${snapshot.data?.data?.posts![index].title}" ==
                                      null
                                  ? "Article belum ada"
                                  : "${snapshot.data?.data?.posts![index].title}"),
                        );
                },
              );
            }
          },
        ));
  }
}
