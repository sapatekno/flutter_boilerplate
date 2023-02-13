import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/router/go.router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('appbar')),
      body: Center(
        child: ElevatedButton(
          child: Text('logout'),
          onPressed: () {
            context.go(pathInitial);
          },
        ),
      ),
    );
  }
}
