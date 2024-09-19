import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'table_order_get.freezed.dart';

@freezed
class TableOrderGet with _$TableOrderGet {
  const factory TableOrderGet({
    @Default(TableOrderGet.defaultId) int id,
    @Default(TableOrderGet.defaultStatus) int status,
    @Default(TableOrderGet.defaultPayType) int payType,
    @Default(TableOrderGet.defaultOrders) List<MOrderGet> orders,
  }) = _User;

  static const defaultId = 0;
  static const defaultStatus = 0;
  static const defaultPayType = 0;
  static const defaultOrders = <MOrderGet>[];
}
