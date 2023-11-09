import 'package:flutter/material.dart';
import 'article_item.dart';

Widget articleBuild(list, context, {bool isSearch = false}) => list.isEmpty
    ? !isSearch
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ))
        : Container()
    : ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
        itemCount: list.length);
