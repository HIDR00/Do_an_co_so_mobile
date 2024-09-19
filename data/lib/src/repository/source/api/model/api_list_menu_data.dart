import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_menu_data.dart';

part 'api_list_menu_data.freezed.dart';
part 'api_list_menu_data.g.dart';

@freezed
class ApiListMenuData with _$ApiListMenuData {

	const ApiListMenuData._();

	factory ApiListMenuData({
		@JsonKey(name: 'data') List<ApiMenuData>? data,
	}) = _ApiListMenuData;

	factory ApiListMenuData.fromJson(Map<String, dynamic> json) => _$ApiListMenuDataFromJson(json);
}
