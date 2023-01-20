import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final VoidCallback callback;

  const FailureWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: callback,
        child: const Text('Error'),
      ),
    );
  }
}
