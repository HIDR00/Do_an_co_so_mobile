import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_categories_data.freezed.dart';
part 'api_categories_data.g.dart';

@freezed
class ApiCategoriesData with _$ApiCategoriesData {

	const ApiCategoriesData._();

	factory ApiCategoriesData({
		@JsonKey(name: 'id') int? id,
		@JsonKey(name: 'created_at') String? createdAt,
		@JsonKey(name: 'updated_at') String? updatedAt,
		@JsonKey(name: 'deleted_at') String? deletedAt,
		@JsonKey(name: 'name') String? name,
	}) = _ApiCategoriesData;

	factory ApiCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiCategoriesDataFromJson(json);
}
