import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_list_table_data.freezed.dart';
part 'api_list_table_data.g.dart';

@freezed
class ApiListTableData with _$ApiListTableData {
  const factory ApiListTableData({
    @JsonKey(name: 'data') List<ApiTableData>? lApiTableData,
  }) = _ApiListTableData;

  factory ApiListTableData.fromJson(Map<String, dynamic> json) => _$ApiListTableDataFromJson(json);
}


@freezed
class ApiTableData with _$ApiTableData {
  const factory ApiTableData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'pay_type') int? payType,
  }) = _ApiTableData;

  factory ApiTableData.fromJson(Map<String, dynamic> json) => _$ApiTableDataFromJson(json);
}
