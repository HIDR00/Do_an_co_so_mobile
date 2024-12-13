import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    @Default(Menu.defaultId) int id,
    @Default(Menu.defaultCreatedAt) String createdAt,
    @Default(Menu.defaultUpdatedAt) String updatedAt,
    @Default(Menu.defaultDeletedAt) String deletedAt,
    @Default(Menu.defaultName) String name,
    @Default(Menu.defaultPrice) int price,
    @Default(Menu.defaultImageUrl) String imageUrl,
    @Default(Menu.defaultCategoriesId) int categoriesId,
    @Default(Menu.defaultDiscription) String discription
  }) = _Menu;

  static const defaultId = 0;
  static const defaultCreatedAt = '';
  static const defaultUpdatedAt = '';
  static const defaultDeletedAt = '';
  static const defaultName = '';
  static const defaultPrice = 0;
  static const defaultImageUrl = '';
  static const defaultCategoriesId = 0;
  static const defaultDiscription = '';
}
