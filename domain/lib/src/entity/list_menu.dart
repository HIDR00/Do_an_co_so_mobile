import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'list_menu.freezed.dart';
  
@freezed
class ListMenu with _$ListMenu {
    const factory ListMenu({
        @Default(ListMenu.defaultData) List<Menu> data,
    }) = _User;
  
    static const defaultData = <Menu>[];
}  
