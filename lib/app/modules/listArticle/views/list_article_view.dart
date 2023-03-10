import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/app/data/endpoint.dart';
import 'package:news_app/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';
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
              }
              if (!snapshot.hasData) {
                return Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Lottie.asset("assets/relax.json", fit: BoxFit.cover),
                      SizedBox(height: 10),
                      Text("Maaf , untuk article nya masih belum tersedia")
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.data?.posts?.length,
                itemBuilder: (context, index) {
                  final listArticle = snapshot.data?.data?.posts?[index];
                  return Card(
                    child: ListTile(
                      onTap: () => Get.toNamed(Routes.DETAIL_ARTICLE,
                          arguments: listArticle),
                      leading: Container(
                        width: 50,
                        height: Get.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${listArticle?.thumbnail}"),
                          ),
                        ),
                      ),
                      title: Text(
                          textAlign: TextAlign.justify,
                          "${listArticle?.title}" == null
                              ? "Article belum ada"
                              : "${listArticle?.title}"),
                    ),
                  );
                },
              );
            }));
  }
}
