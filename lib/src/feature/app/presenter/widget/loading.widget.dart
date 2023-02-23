import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
          'assets/lottiefiles/loading.zip', frameRate: FrameRate(30), filterQuality: FilterQuality.high, width: 80.w, fit: BoxFit.fitWidth),
    );
  }
}
