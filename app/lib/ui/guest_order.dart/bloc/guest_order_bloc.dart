import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';

@Injectable()
class GuestOrderBloc extends BaseBloc<GuestOrderEvent, GuestOrderState> {
  GuestOrderBloc(this._repository) : super(GuestOrderState()) {
    on<GuestOrderPageInitiated>(
      _onGuestOrderPageInitiated,
      transformer: log(),
    );
    on<GuestOrderPageFreeTable>(
      _onGuestOrderPageFreeTable,
      transformer: log(),
    );
  }

  final Repository _repository;

  FutureOr<void> _onGuestOrderPageInitiated(
      GuestOrderPageInitiated event, Emitter<GuestOrderState> emit) async {
    return runBlocCatching(
      action: () async {
        final output = await _repository.getOderGuest(event.tableId);
        emit(state.copyWith(loder: output));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }

  FutureOr<void> _onGuestOrderPageFreeTable(
      GuestOrderPageFreeTable event, Emitter<GuestOrderState> emit) async {
    return runBlocCatching(
      action: () async { 
        double totalPrice = 0;
        for(var i in state.loder.orders){
          totalPrice+=i.quantity*i.menu.price;
        }
        if(state.status < 3){
          await _repository.updateTableStatus(event.tableId,state.status+1);
          await _repository.postEmployeeHandleOrder(EmployeeHandleOrder(userId: _repository.getUserPreference().id,tableStatus: state.status,tableId: event.tableId,totalPrice: totalPrice));
        }else{
          await _repository.deleteUser(event.tableId);
          await _repository.postEmployeeHandleOrder(EmployeeHandleOrder(userId: _repository.getUserPreference().id,tableStatus: 3,tableId: event.tableId,totalPrice: totalPrice));
          await navigator.pop();
        }
        emit(state.copyWith(isShimmerLoading: true,status: state.status+1));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
