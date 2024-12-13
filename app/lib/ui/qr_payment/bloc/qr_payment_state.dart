import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'qr_payment_state.freezed.dart';

@freezed
class QrPaymentState extends BaseBlocState with _$QrPaymentState {
  const QrPaymentState._();

  const factory QrPaymentState({
    @Default('') String id,
    @Default('') String data,
  }) = _QrPaymentState;
}
