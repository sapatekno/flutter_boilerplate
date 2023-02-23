import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../data/entity/failure.dart';

class FailureWidget extends StatelessWidget {
  final String message;

  final void Function() callback;

  const FailureWidget(this.message, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = Failure.getMessage(context, this.message);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottiefiles/error.zip',
            frameRate: FrameRate(30),
            filterQuality: FilterQuality.high,
            width: 50.w,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              message.toTitleCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 4.h),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: Text(AppLocalizations.of(context)!.retry.toTitleCase()),
            onPressed: callback,
          ),
        ],
      ),
    );
  }
}
