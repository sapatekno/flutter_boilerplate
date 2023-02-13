import 'config.dart';

class StagConfig implements Config {
  @override
  Environment get appEnvironment => Environment.staging;

  @override
  String get appName => 'Staging';

  @override
  String get surveyAmiApiUrl => 'http://10.232.1.21:7063/api/v1/';
}
