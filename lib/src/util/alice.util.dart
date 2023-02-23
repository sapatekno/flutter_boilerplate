import 'package:alice/alice.dart';
import 'package:flutter/material.dart';

import '../router/sl.router.dart';

class AliceUtil {
  final Alice alice;

  AliceUtil(this.alice);

  Alice get instance {
    var instance = alice;
    instance.setNavigatorKey(sl.get<GlobalKey<NavigatorState>>());
    return instance;
  }
}
