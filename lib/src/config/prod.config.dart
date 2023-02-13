import 'config.dart';

class ProdConfig implements Config {
  @override
  String get appName => 'production';

  @override
  Environment get appEnvironment => Environment.production;

  @override
  String get surveyAmiApiUrl => 'http://10.232.1.21:7063/api/v1/';
}
