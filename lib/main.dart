import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigator_simple/app_navigator.dart';
import 'package:flutter_navigator_simple/cubit/page/page_cubit.dart';
import 'package:flutter_navigator_simple/example_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => ExampleRepo())
        ],
        child: BlocProvider<PageCubit>(
            create: (context) => PageCubit(exampleRepo: context.read<ExampleRepo>()),
            child: const AppNavigator(),
        ),
      ),
    );
  }
}
