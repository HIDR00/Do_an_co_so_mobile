import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_list_categories_data.freezed.dart';
part 'api_list_categories_data.g.dart';

@freezed
class ApiCategoriesResponse with _$ApiCategoriesResponse {
  const factory ApiCategoriesResponse({
    @JsonKey(name: 'data') ApiListCategoriesData? data,
  }) = _ApiCategoriesResponse;

  factory ApiCategoriesResponse.fromJson(Map<String, dynamic> json) => _$ApiCategoriesResponseFromJson(json);
}

@freezed
class ApiListCategoriesData with _$ApiListCategoriesData {
  const factory ApiListCategoriesData({
    @JsonKey(name: 'categories') List<ApiCategoriesData>? categories,
    @JsonKey(name: 'totalPages') int? totalPages,
  }) = _ApiListCategoriesData;

  factory ApiListCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiListCategoriesDataFromJson(json);
}

@freezed
class ApiCategoriesData with _$ApiCategoriesData {
  const factory ApiCategoriesData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'categoryName') String? categoryName,
  }) = _ApiCategoriesData;

  factory ApiCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiCategoriesDataFromJson(json);
}
