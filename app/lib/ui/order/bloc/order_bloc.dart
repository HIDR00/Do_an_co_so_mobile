import 'dart:async';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app.dart';
import 'order.dart';

@Injectable()
class OrderBloc extends BaseBloc<OrderEvent, OrderState> {
  OrderBloc(this._repository,this._apiService) : super(OrderState()) {
    on<OrderPageInitiated>(
      _onOrderPageInitiated,
      transformer: log(),
    );
    on<OrderPagePostOrder>(
      _onOrderPagePostOrder,
      transformer: log(),
    );
    on<OrderPagePostPay>(
      _onOrderPagePostPay,
      transformer: log(),
    );
  }
  final Repository _repository;
  final AppApiService _apiService;
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

  FutureOr<void> _onOrderPagePostOrder(OrderPagePostOrder event, Emitter<OrderState> emit) async {
    return runBlocCatching(
      action: () async {
        List<MOrderItem> lOrderItem = [];
        for(var i in event.lItemCategoriesOder){
          lOrderItem.add(MOrderItem(itemId: i.id,quantity: event.item[i.id] ?? 0));
        }
        await _repository.postListOrder(lOrderItem, event.tableId);
        await _apiService.postNoti('Ordered','Bàn ${event.tableId} đặt món');
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }

  FutureOr<void> _onOrderPagePostPay(OrderPagePostPay event, Emitter<OrderState> emit) async {
    return runBlocCatching(
      action: () async {
        List<MOrderItem> lOrderItem = [];
        for(var i in event.lItemCategoriesOder){
          lOrderItem.add(MOrderItem(itemId: i.id,quantity: event.item[i.id] ?? 0));
        }
        await _repository.postListOrder(lOrderItem, event.tableId);
        await _apiService.postNoti('Ordered','Bàn ${event.tableId} đặt món');
        final _output = await _apiService.postPay(event.tableId,event.isMomo);
        if(event.isMomo){
          await launch(_output?.data ?? '');
        }
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
