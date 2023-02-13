import 'config.dart';

class DevConfig extends Config {
  @override
  String get appName => 'Development';

  @override
  Environment get appEnvironment => Environment.development;

  @override
  String get surveyAmiApiUrl => 'http://10.232.1.21:7063/api/v1/';
}
