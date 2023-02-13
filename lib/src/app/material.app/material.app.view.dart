import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feature/auth/auth.login/presenter/page/login.page.dart';
import '../../router/sl.router.dart';

class MaterialAppView extends StatelessWidget {
  MaterialAppView({Key? key}) : super(key: key);

  final Alice alice = sl.get<Alice>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: alice.getNavigatorKey(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('id'),
      title: 'Flutter Boilerplate',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
        primarySwatch: Colors.indigo,
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      ),
      home: LoginPage(),
    );
  }
}
