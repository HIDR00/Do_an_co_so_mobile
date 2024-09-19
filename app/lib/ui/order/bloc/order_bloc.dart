import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'order.dart';

@Injectable()
class OrderBloc extends BaseBloc<OrderEvent, OrderState> {
  OrderBloc(this._repository) : super(OrderState()) {
    on<OrderPageInitiated>(
      _onOrderPageInitiated,
      transformer: log(),
    );
    on<OrderPagePostOrder>(
      _onOrderPagePostOrder,
      transformer: log(),
    );
  }
  final Repository _repository;
  FutureOr<void> _onOrderPageInitiated(OrderPageInitiated event, Emitter<OrderState> emit) async {
    return runBlocCatching(
      action: () async {
        final categoriesMap = {
          0: <Menu>[], // Appetizers
          1: <Menu>[], // Main Course
          2: <Menu>[], // Vegetarian Dishes
          3: <Menu>[], // Fusion Dishes
          4: <Menu>[], // Desserts
          5: <Menu>[], // Drinks
        };

        for (var menuItem in event.lItemMenuOder) {
          categoriesMap[menuItem.categoriesId]?.add(menuItem);
        }

        emit(state.copyWith(
          lAppetizers: categoriesMap[0]!,
          lMainCourse: categoriesMap[1]!,
          lVegetarianDishes: categoriesMap[2]!,
          lFusionDishes: categoriesMap[3]!,
          lDesserts: categoriesMap[4]!,
          lDrinks: categoriesMap[5]!,
        ));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }

  FutureOr<void> _onOrderPagePostOrder(OrderPagePostOrder event, Emitter<OrderState> emit) async {
    return runBlocCatching(
      action: () async {
        List<MOrder> lOder = [];
        for(int i = 0;i < event.lItemMenuOder.length;i++){
          lOder.add(MOrder(tableId: event.tableId,quantity: event.item[event.lItemMenuOder[i].id] ?? 1,menuId: event.lItemMenuOder[i].id));
        }
        final tableOrder = TableOrder(payType: event.payType,status: 1,orders: lOder);
        await _repository.postTableOrder(event.tableId,tableOrder);
        await navigator.replace(const AppRouteInfo.main());
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
