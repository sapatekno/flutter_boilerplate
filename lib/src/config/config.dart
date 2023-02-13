import '../feature/app/data/entity/failure.dart';

enum Environment { development, production, staging }

abstract class Config {
  String get appName;

  Environment get appEnvironment;

  String get surveyAmiApiUrl;
}

/// * App State for BLOC
class MainState {}

class InitState extends MainState {}

class LoadState extends MainState {}

class DataState<T> extends MainState {
  final T data;

  DataState(this.data);
}

class FailState extends MainState {
  final Failure failure;

  FailState(this.failure);
}

class AlertState<T> extends MainState {
  final T data;

  AlertState(this.data);
}

enum ListState<T> { init, initDone, initFail, load, loadDone, loadFail, refresh, refreshDone, refreshFail }

enum MiniState<T> { init, done, fail }
