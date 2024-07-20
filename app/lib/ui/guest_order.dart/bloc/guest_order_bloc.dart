import 'dart:async';

import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'guest_order.dart';

@Injectable()
class GuestOrderBloc extends BaseBloc<GuestOrderEvent, GuestOrderState> {
  GuestOrderBloc(this._apiService) : super(GuestOrderState()) {
    on<GuestOrderPageInitiated>(
      _onGuestOrderPageInitiated,
      transformer: log(),
    );
    on<GuestOrderPageFreeTable>(
      _onGuestOrderPageFreeTable,
      transformer: log(),
    );
  }
  final AppApiService _apiService;

  FutureOr<void> _onGuestOrderPageInitiated(
      GuestOrderPageInitiated event, Emitter<GuestOrderState> emit) async {
    return runBlocCatching(
      action: () async {
        final _output = await _apiService.getOderGuest(event.tableId);
        emit(state.copyWith(oder: _output));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }

  FutureOr<void> _onGuestOrderPageFreeTable(
      GuestOrderPageFreeTable event, Emitter<GuestOrderState> emit) async {
    return runBlocCatching(
      action: () async {
        await _apiService.postFreeTable(event.tableId);
        emit(state.copyWith(isShimmerLoading: true));
      },
      doOnSubscribe: () async {},
      doOnEventCompleted: () async {},
    );
  }
}
