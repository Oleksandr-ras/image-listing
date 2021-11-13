import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_task/bloc/data_event.dart';
import 'package:json_task/bloc/data_state.dart';
import 'package:json_task/models/data_model.dart';
import 'package:json_task/models/repository/data_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {

  final DataRepository dataRepository;
  DataBloc({required this.dataRepository}) : super(StateInitData());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if(event is OpenAppEvent) {
      yield StateLoadData();
      try{
        final List<DataModel> _doneDataList = await dataRepository.getAllData();
        yield StateLoadSuccess(loadedData: _doneDataList);
      } catch (e) {
        yield StateLoadError(error: e);
      }
    }
  }

}