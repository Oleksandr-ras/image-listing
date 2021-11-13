import 'package:json_task/models/data_model.dart';
import 'package:json_task/models/data_providers/get_data.dart';

class DataRepository {
  final DataProvider _dataProvider = DataProvider();
  Future<List<DataModel>> getAllData() => _dataProvider.getData();
}