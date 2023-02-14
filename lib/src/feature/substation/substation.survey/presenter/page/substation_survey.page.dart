import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:sizer/sizer.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../location/presenter/widget/location_tagging.widget.dart';

class SubStationSurveyPage extends StatelessWidget {
  const SubStationSurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: AppLocalizations.of(context)!.findSubstationNumber.toTitleCase(),
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.cloud, color: Theme.of(context).primaryColor),
                  title: Text(
                    AppLocalizations.of(context)!.dataServer.toTitleCase(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.substationNumber.toTitleCase(),
                            style: const TextStyle(
                              height: 2,
                            ),
                          ),
                          const Text(': ', style: TextStyle(height: 2)),
                          const Text('-', style: TextStyle(height: 2)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.latitude.toTitleCase(),
                            style: const TextStyle(
                              height: 2,
                            ),
                          ),
                          const Text(': ', style: TextStyle(height: 2)),
                          const Text('-', style: TextStyle(height: 2)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.longitude.toTitleCase(),
                            style: const TextStyle(
                              height: 2,
                            ),
                          ),
                          const Text(': ', style: TextStyle(height: 2)),
                          const Text('-', style: TextStyle(height: 2)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: LocationTaggingWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(3.w),
          child: ElevatedButton.icon(
            onPressed: null,
            icon: const Icon(Icons.save_alt),
            label: Text(
              AppLocalizations.of(context)!.save.toTitleCase(),
            ),
          ),
        ),
      ],
    );
  }
}
