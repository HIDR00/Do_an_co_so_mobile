import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_list_item_categories_data.freezed.dart';
part 'api_list_item_categories_data.g.dart';

@freezed
class ApiListItemCategoriesData with _$ApiListItemCategoriesData {
  const factory ApiListItemCategoriesData({
    @JsonKey(name: 'data') ApiItemCategoriesResponseListData? data,
  }) = _ApiListItemCategoriesData;

  factory ApiListItemCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiListItemCategoriesDataFromJson(json);
}

@freezed
class ApiItemCategoriesResponseListData with _$ApiItemCategoriesResponseListData {
  const factory ApiItemCategoriesResponseListData({
    @JsonKey(name: 'menuItemResponseList') List<ApiItemCategoriesData>? lItemCategories,
  }) = _ApiItemCategoriesResponseListData;

  factory ApiItemCategoriesResponseListData.fromJson(Map<String, dynamic> json) => _$ApiItemCategoriesResponseListDataFromJson(json);
}


@freezed
class ApiItemCategoriesData with _$ApiItemCategoriesData {
  const factory ApiItemCategoriesData({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'itemName') String? name,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'categoryName') String? beverages,
  }) = _ApiItemCategoriesData;

  factory ApiItemCategoriesData.fromJson(Map<String, dynamic> json) => _$ApiItemCategoriesDataFromJson(json);
}
