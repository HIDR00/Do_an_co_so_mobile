import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';

@freezed
class Categories with _$Categories {
  const factory Categories({
    @Default(Categories.defaultId) int id,
    @Default(Categories.defaultCreatedAt) String createdAt,
    @Default(Categories.defaultUpdatedAt) String updatedAt,
    @Default(Categories.defaultDeletedAt) String deletedAt,
    @Default(Categories.defaultName) String name,
  }) = _Categories;

  static const defaultId = 0;
  static const defaultCreatedAt = '';
  static const defaultUpdatedAt = '';
  static const defaultDeletedAt = '';
  static const defaultName = '';
}
