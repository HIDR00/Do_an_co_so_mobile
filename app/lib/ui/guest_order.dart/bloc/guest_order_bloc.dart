import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'guest_order.dart';

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
        final _output = await _repository.getOderGuest(event.tableId);
        emit(state.copyWith(loder: _output));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }

  FutureOr<void> _onGuestOrderPageFreeTable(
      GuestOrderPageFreeTable event, Emitter<GuestOrderState> emit) async {
    return runBlocCatching(
      action: () async {
        await _repository.deleteUser(event.tableId);
        emit(state.copyWith(isShimmerLoading: true));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
