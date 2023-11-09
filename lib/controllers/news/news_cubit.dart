import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/cache_helper.dart';
import 'package:news_app/core/network/remote/api_keys.dart';
import 'package:news_app/core/network/remote/dio_helper.dart';
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

  void changeBottomNavBar(int index) {
    if (index == 1) {
      getSport();
    } else if (index == 2) {
      getScience();
    }
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headLines', query: {
      'language': 'en',
      'category': 'business',
      'apiKey': ApiKeys.key,
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    if (sport.isEmpty) {
      emit(NewsGetSportLoadingState());

      DioHelper.getData(url: 'v2/top-headLines', query: {
        'language': 'en',
        'category': 'sports',
        'apiKey': ApiKeys.key,
      }).then((value) {
        sport = value.data['articles'];
        emit(NewsGetSportSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetSportErrorState(e.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (science.isEmpty) {
      emit(NewsGetScienceLoadingState());

      DioHelper.getData(url: 'v2/top-headLines', query: {
        'language': 'en',
        'category': 'science',
        'apiKey': ApiKeys.key,
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetScienceErrorState(e.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  bool isDark = CacheHelper.getData('isDark') ?? false;
  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.putData('isDark', isDark).then((value) {
      print(CacheHelper.getData('isDark'));
      emit(NewsChangeModeState());
    });
  }

  List<dynamic> search = [];
  void getSearch(String sValue) {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
            url: 'v2/everything',
            query: {'q': sValue, 'apiKey': '4e19b60f031a48ccac9bcd312ef6cebf'})
        .then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetSearchErrorState(e.toString()));
    });
  }
}
