import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_simple/cubit/page/page_state.dart';
import 'package:flutter_navigator_simple/example_repo.dart';
import 'package:flutter_navigator_simple/view/page_2_view.dart';

class PageCubit extends Cubit<PageState> {
  final ExampleRepo exampleRepo;

  //sudah diwakilkan di bawah
  //// void showSplashScreenView() => emit(PageSplashScreenState());
  PageCubit({required this.exampleRepo}) : super(PageSplashScreenState()) {
    checkCurrentPageState();
  }

  void checkCurrentPageState() async {
    try {
      final name = await exampleRepo.exampleFunction("");
      if(name.isNotEmpty) {
        emit(PagePage2State(data: name));
      } else {
        emit(PageMenuState());
      }
    } on Exception {
      emit(PageSplashScreenState());
    }
  }

  void showSplashScreenView() => emit(PageSplashScreenState());

  void showMenuView() => emit(PageMenuState());

  void showPage1View() => emit(PagePage1State());

  void showPage2View(String str) => emit(PagePage2State(data: str));
}
