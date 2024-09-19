import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_menu_data.freezed.dart';
part 'api_menu_data.g.dart';

@freezed
class ApiMenuData with _$ApiMenuData {

	const ApiMenuData._();

	factory ApiMenuData({
		@JsonKey(name: 'id') int? id,
		@JsonKey(name: 'created_at') String? createdAt,
		@JsonKey(name: 'updated_at') String? updatedAt,
		@JsonKey(name: 'deleted_at') String? deletedAt,
		@JsonKey(name: 'name') String? name,
		@JsonKey(name: 'price') int? price,
		@JsonKey(name: 'image_url') String? imageUrl,
		@JsonKey(name: 'categories_id') int? categoriesId,
	}) = _ApiMenuData;

	factory ApiMenuData.fromJson(Map<String, dynamic> json) => _$ApiMenuDataFromJson(json);
}
