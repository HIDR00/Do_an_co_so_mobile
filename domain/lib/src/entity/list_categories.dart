import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'list_categories.freezed.dart';
  
@freezed
class ListCategories with _$ListCategories {
    const factory ListCategories({
        @Default(ListCategories.defaultData) List<Categories> data,
    }) = _User;
  
    static const defaultData = <Categories>[];
}  
