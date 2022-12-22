import '../data/entity/app/failure.dart';

class StateApp {}

class InitState extends StateApp {}

class LoadState extends StateApp {}

class DataState<T> extends StateApp {
  final T data;

  DataState(this.data);
}

class FailState extends StateApp {
  final Failure failure;

  FailState(this.failure);
}

enum ListState<T> { init, initDone, initFail, load, loadDone, loadFail, refresh, refreshDone, refreshFail }

enum MiniState<T> { init, done, fail }
