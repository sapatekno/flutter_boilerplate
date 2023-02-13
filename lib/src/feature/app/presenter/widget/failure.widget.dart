import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
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
          Icon(
            Icons.error,
            color: Colors.red,
            size: 40.w,
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
            child: Text(
              message.toTitleCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ElevatedButton(
            onPressed: callback,
            child: Text(AppLocalizations.of(context)!.retry.toTitleCase()),
          ),
        ],
      ),
    );
  }
}
