// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel{
  final String score;
  @JsonKey(name: 'filename')
  final String image_url;

  DataModel({required this.score, required this.image_url});

  //Decode json
  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  //Encode json(don't use in this case)

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}