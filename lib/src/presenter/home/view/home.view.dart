import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/presenter/home/widget/list_user.widget.dart';

import '../../../app/sl.app.dart';
import '../../user/cubit/home.cubit.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ValueNotifier<int> index = ValueNotifier(0);
  final HomeCubit homeCubit = sl.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (context, selectedIndex, widget) {
          if (selectedIndex == 0) {
            return ListUserWidget();
          } else {}

          return Text('$selectedIndex');
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (context, selectedIndex, widget) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'User',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: 'Saved',
              ),
            ],
            onTap: (location) {
              index.value = location;
            },
          );
        },
      ),
    );
  }
}
