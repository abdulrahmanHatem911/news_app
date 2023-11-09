import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controllers/news/news_cubit.dart';
import 'package:news_app/core/helpers/cache_helper.dart';
import 'package:news_app/core/style/theme.dart';

import 'core/network/remote/dio_helper.dart';
import 'modules/screens/layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: newsCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
