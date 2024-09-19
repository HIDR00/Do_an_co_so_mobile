import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_categories_data.dart';

part 'api_list_categories_data.freezed.dart';
part 'api_list_categories_data.g.dart';

@freezed
class ApiListCategoriesData with _$ApiListCategoriesData {

	const ApiListCategoriesData._();

	factory ApiListCategoriesData({
		@JsonKey(name: 'data') List<ApiCategoriesData>? data,
	}) = _ApiListCategoriesData;

	factory ApiListCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiListCategoriesDataFromJson(json);
}
