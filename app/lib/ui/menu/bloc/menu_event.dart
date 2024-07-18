import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'menu_event.freezed.dart';

abstract class MenuEvent extends BaseBlocEvent {
  const MenuEvent();
}

@freezed
class MenuPageInitiated extends MenuEvent with _$MenuPageInitiated {
  const factory MenuPageInitiated() = _MenuPageInitiated;
}

@freezed
class TabViewInitiated extends MenuEvent with _$TabViewInitiated {
  const factory TabViewInitiated(String categories) = _TabViewInitiated;
}

@freezed
class TabViewAddOrder extends MenuEvent with _$TabViewAddOrder {
  const factory TabViewAddOrder(MItemCategories itemCategoriesOder) = _TabViewAddOrder;
}
