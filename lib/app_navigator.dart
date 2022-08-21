import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_simple/cubit/page/page_cubit.dart';
import 'package:flutter_navigator_simple/cubit/page/page_state.dart';
import 'package:flutter_navigator_simple/view/menu_view.dart';
import 'package:flutter_navigator_simple/view/page_1_view.dart';
import 'package:flutter_navigator_simple/view/page_2_view.dart';
import 'package:flutter_navigator_simple/view/splash_screen_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is PageSplashScreenState)
            const MaterialPage(child: SplashScreenView()),

          if(state is PageMenuState)
            const MaterialPage(child: MenuView()),

          if(state is PagePage1State)
            const MaterialPage(child: Page1View()),

          if(state is PagePage2State)
            const MaterialPage(child: Page2View()),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      );
    });
  }
}
