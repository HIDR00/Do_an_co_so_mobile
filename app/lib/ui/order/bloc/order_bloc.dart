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
  }
  final Repository _repository;

  FutureOr<void> _onOrderPageInitiated(OrderPageInitiated event, Emitter<OrderState> emit) async {
    return runBlocCatching(
      action: () async {
        var lBeverages = List<MItemCategories>.from([]);
        var lAppetizers = List<MItemCategories>.from([]);
        var lMainCourse = List<MItemCategories>.from([]);
        var lDesserts = List<MItemCategories>.from([]);
        var lSalads = List<MItemCategories>.from([]);
        for (var i in event.lItemCategoriesOder) {
          if (i.categoryName == 'Beverages') {
            lBeverages.add(i);
          } else if (i.categoryName == 'Appetizers') {
            lAppetizers.add(i);
          } else if (i.categoryName == 'Main Courses') {
            lMainCourse.add(i);
          } else if (i.categoryName == 'Desserts') {
            lDesserts.add(i);
          } else if (i.categoryName == 'Vegetarian') {
            lSalads.add(i);
          }
        }

        emit(state.copyWith(
          lBeverages: lBeverages,
          lAppetizers: lAppetizers,
          lMainCourse: lMainCourse,
          lDesserts: lDesserts,
          lSalads: lSalads,
        ));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
