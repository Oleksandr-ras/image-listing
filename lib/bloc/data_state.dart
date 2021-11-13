abstract class DataState{}

class StateInitData extends DataState{}

class StateLoadData extends DataState{}

class StateLoadSuccess extends DataState{
  List<dynamic> loadedData;

  StateLoadSuccess({required this.loadedData});
}

class StateLoadError extends DataState{
  final Object error;
  StateLoadError({required this.error});
}