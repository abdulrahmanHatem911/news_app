import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/news/news_cubit.dart';
import 'package:news_app/modules/widgets/article_builder.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "search must be not empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(
                      label: Text("Search"), prefixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(child: articleBuild(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
