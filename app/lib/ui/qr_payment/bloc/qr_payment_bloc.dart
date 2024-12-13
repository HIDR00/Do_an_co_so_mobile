import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../app.dart';
import 'qr_payment.dart';
  
@Injectable()
class QrPaymentBloc extends BaseBloc<QrPaymentEvent, QrPaymentState> {
  QrPaymentBloc(this._repository) : super(const QrPaymentState()) {
    on<QrPaymentPageInitiated>(
      _onQrPaymentPageInitiated,
      transformer: log(),
    );
  }

  final Repository _repository;


  FutureOr<void> _onQrPaymentPageInitiated(
    QrPaymentPageInitiated event,
    Emitter<QrPaymentState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
      final result = await _repository.postPayment(event.amount);
      emit(state.copyWith(data: result ?? ''));

    },
    doOnEventCompleted: () async {
      IntentUtils.openBrowserURL(url: state.data);
      navigator.push(const AppRouteInfo.main());
    },
    );
  }
}
