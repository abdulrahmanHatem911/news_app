import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/news/news_cubit.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/widgets/article_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          List<NewsModel> list = newsCubit.search;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "search must be not empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    newsCubit.getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: articleBuild(list, context, isSearch: true),
              ),
            ],
          );
        },
      ),
    );
  }
}
