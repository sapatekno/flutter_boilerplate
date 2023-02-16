import 'package:dio_log/dio_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:surveyami/src/feature/app/presenter/widget/dialog.widget.dart';
import 'package:surveyami/src/feature/customer/customer.survey/presenter/page/customer_survey.page.dart';
import 'package:surveyami/src/feature/substation/substation.survey/presenter/page/substation_survey.page.dart';
import 'package:surveyami/src/util/string.util.dart';

import '../../../../router/go.router.dart';
import '../../../../router/sl.router.dart';
import '../../../app/data/session/session.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<HomeData> listHomeData = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDebugBtn(context, btnColor: Theme.of(context).primaryColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    listHomeData = [
      HomeData(
        title: AppLocalizations.of(context)!.substationSurvey,
        page: SubStationSurveyPage(),
      ),
      HomeData(
        title: AppLocalizations.of(context)!.customerSurvey,
        page: const CustomerSurveyPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(listHomeData[currentIndex].title.toTitleCase()),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showConfirmDialog(
                context,
                AppLocalizations.of(context)!.logout,
                AppLocalizations.of(context)!.logoutConfirmation,
                AppLocalizations.of(context)!.yes,
                AppLocalizations.of(context)!.no,
                    () async {
                  var session = sl.get<Session>();
                  await session.remove();
                  context.go(pathInitial);
                },
              );
            },
          )
        ],
      ),
      body: listHomeData[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.charging_station),
            label: 'Gardu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pelanggan',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (selected) {
          setState(() {
            currentIndex = selected;
          });
        },
      ),
    );
  }
}

class HomeData {
  final String title;
  final Widget page;

  HomeData({required this.title, required this.page});
}
