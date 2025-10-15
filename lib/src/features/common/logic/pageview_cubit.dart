import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewCubit extends Cubit<int> {
  PageViewCubit({int index = 0}) : super(index);
  void onPageChanged(int value) {
    emit(value);
  }

  PageController pageController = PageController();
  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic);
  }

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic);
  }
}
