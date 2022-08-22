# flutter_navigator_simple

|<img src="/preview/preview1.png" width="300"/>|<img src="/preview/preview2.png" width="300"/>|<img src="/preview/preview3.png" width="300"/>|<img src="/preview/preview4.png" width="300"/>|
|--|--|--|--|

```
flutter_bloc: ^7.2.0
```

- [page_cubit.dart](/lib/page_cubit.dart)
- [page_state.dart](/lib/page_state.dart)
- [menu_view.dart](/lib/menu_view.dart)
- [page_1_view.dart](/lib/page_1_view.dart)
- [page_2_view.dart](/lib/page_2_view.dart)
- [splash_screen_view.dart](/lib/splash_screen_view.dart)
- [app_navigator.dart](/lib/app_navigator.dart)
- [example_repo.dart](/lib/example_repo.dart)
- [main.dart](/lib/main.dart)

- app_navigator.dart
```dart
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
```

- splash_screen_view.dart
```dart
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SplashScreen"),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
```

- menu_view.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_simple/cubit/page/page_cubit.dart';
import 'package:flutter_navigator_simple/cubit/page/page_state.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<PageCubit, PageState>(builder: (context, state) {
              return ElevatedButton(
                child: const Text("Page 1"),
                onPressed: () {
                  context.read<PageCubit>().showPage1View();
                },
              );
            }),
            BlocBuilder<PageCubit, PageState>(builder: (context, state) {
              return ElevatedButton(
                child: const Text("page 2"),
                onPressed: () {
                  context.read<PageCubit>().showPage2View("Zein");
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
```

- page_cubit.dart
```dart
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
```

---

```
Copyright 2022 M. Fadli Zein
```