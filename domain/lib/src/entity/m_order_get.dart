import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'm_order_get.freezed.dart';

@freezed
class MOrderGet with _$MOrderGet {
  const factory MOrderGet({
    @Default(MOrderGet.defaultTableId) int tableId,
    @Default(MOrderGet.defaultMenuId) int menuId,
    @Default(MOrderGet.defaultQuantity) int quantity,
    @Default(MOrderGet.defaultMenu) Menu menu,
  }) = _User;

  static const defaultTableId = 0;
  static const defaultMenuId = 0;
  static const defaultQuantity = 0;
  static const defaultMenu = Menu();
}
