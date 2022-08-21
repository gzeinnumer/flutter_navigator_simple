abstract class PageState {}

class PageSplashScreenState extends PageState {}

class PageMenuState extends PageState {}

class PagePage1State extends PageState {}

class PagePage2State extends PageState {
  final dynamic data;

  PagePage2State({this.data});
}
