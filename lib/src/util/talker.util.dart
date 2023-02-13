import 'package:talker_flutter/talker_flutter.dart';

class TalkerUtil {
  Talker get talker => TalkerFlutter.init(settings: TalkerSettings(useConsoleLogs: false));
}
