import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_color.dart';
import 'package:news_app/models/news_model.dart';

import 'article_item.dart';

Widget articleBuild(List<NewsModel> list, BuildContext context,
        {bool isSearch = false}) =>
    list.isEmpty
        ? !isSearch
            ? const Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              )
            : const Center(
                child: Text(
                  'No Data Found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
                ),
              )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: list.length,
            itemBuilder: (context, index) {
              NewsModel model = list[index];
              return buildArticleItem(model, context);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
          );
