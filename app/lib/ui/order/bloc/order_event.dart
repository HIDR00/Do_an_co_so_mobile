import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'order_event.freezed.dart';

abstract class OrderEvent extends BaseBlocEvent {
  const OrderEvent();
}

@freezed
class OrderPageInitiated extends OrderEvent with _$OrderPageInitiated {
  const factory OrderPageInitiated(List<MItemCategories> lItemCategoriesOder) = _OrderPageInitiated;
}

@freezed
class OrderPagePostOrder extends OrderEvent with _$OrderPagePostOrder {
  const factory OrderPagePostOrder(Map<int, int> item,List<MItemCategories> lItemCategoriesOder,int tableId) = _OrderPagePostOrder;
}

@freezed
class OrderPagePostPay extends OrderEvent with _$OrderPagePostPay {
  const factory OrderPagePostPay(Map<int, int> item,List<MItemCategories> lItemCategoriesOder,int tableId,bool isMomo) = _OrderPagePostPay;
}

