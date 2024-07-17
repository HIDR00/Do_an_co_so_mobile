import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_list_categories.freezed.dart';

@freezed
class MListCategories with _$MListCategories {
  const factory MListCategories({
    @Default(<MCategories>[]) List<MCategories> lMCategories,
  }) = _MListCategories;
}

@freezed
class MCategories with _$MCategories {
  const factory MCategories({
    @Default(-1) int id,
    @Default('') String name,
  }) = _MCategories;
}