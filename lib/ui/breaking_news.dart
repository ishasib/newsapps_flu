import 'package:flutter/material.dart';
import 'package:newsapps_flu/components/news_item.dart';
import 'package:newsapps_flu/service/api_service.dart';

import '../model/nesw_model.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getbreakingnews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articlelist = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItemList(
                  newsModel: articlelist[index],
                );
              },
              itemCount: articlelist.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
