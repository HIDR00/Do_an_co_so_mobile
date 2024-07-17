import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_list_item_categories.freezed.dart';


@freezed
class MItemCategoriesResponseList with _$MItemCategoriesResponseList {
  const factory MItemCategoriesResponseList({
    @Default(<MItemCategories>[]) List<MItemCategories> lMItemCategories,
  }) = _MItemCategoriesResponseList;
}

@freezed
class MItemCategories with _$MItemCategories {
  const factory MItemCategories({
    @Default(-1) int id,
    @Default('') String name,
    @Default(-1) double price,
    @Default('') String image,
    @Default('') String beverages,
  }) = _MItemCategories;
}