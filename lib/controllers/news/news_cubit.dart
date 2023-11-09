import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/cache_helper.dart';
import 'package:news_app/core/network/remote/api_keys.dart';
import 'package:news_app/core/network/remote/dio_helper.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/screens/business.dart';
import 'package:news_app/modules/screens/science.dart';
import 'package:news_app/modules/screens/sport.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<NewsModel> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: ApiKeys.getBusiness).then((value) {
      business.clear();
      value.data['articles'].forEach((element) {
        business.add(NewsModel.fromJson(element));
      });
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  List<NewsModel> sport = [];
  void getSport() {
    emit(NewsGetSportLoadingState());
    DioHelper.getData(url: ApiKeys.getSports).then((value) {
      sport.clear();
      value.data['articles'].forEach((element) {
        sport.add(NewsModel.fromJson(element));
      });
      emit(NewsGetSportSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetSportErrorState(e.toString()));
    });
  }

  List<NewsModel> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: ApiKeys.getScience).then((value) {
      science.clear();
      value.data['articles'].forEach((element) {
        science.add(NewsModel.fromJson(element));
      });
      emit(NewsGetScienceSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetScienceErrorState(e.toString()));
    });
  }

  bool isDark = CacheHelper.getData('isDark') ?? false;
  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.putData('isDark', isDark).then((value) {
      print(CacheHelper.getData('isDark'));
      emit(NewsChangeModeState());
    });
  }

  List<NewsModel> search = [];
  void getSearch(String sValue) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: ApiKeys.search, query: {
      'q': sValue,
      'searchIn': 'title,description',
      'apiKey': ApiKeys.key,
    }).then((value) {
      search.clear();
      value.data['articles'].forEach((element) {
        search.add(NewsModel.fromJson(element));
      });
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }
}
