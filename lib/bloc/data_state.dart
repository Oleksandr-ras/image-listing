abstract class DataState{}

//When app start without data
class StateInitData extends DataState{}

//When data loads
class StateLoadData extends DataState{}

//When data load successful
class StateLoadSuccess extends DataState{
  List<dynamic> loadedData;

  StateLoadSuccess({required this.loadedData});
}

//When data load with error
class StateLoadError extends DataState{
  final Object error;
  StateLoadError({required this.error});
}