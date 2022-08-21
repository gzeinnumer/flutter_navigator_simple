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
