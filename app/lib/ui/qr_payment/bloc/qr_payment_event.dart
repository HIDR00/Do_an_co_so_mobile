import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'qr_payment_event.freezed.dart';

abstract class QrPaymentEvent extends BaseBlocEvent {
  const QrPaymentEvent();
}

@freezed
class QrPaymentPageInitiated extends QrPaymentEvent with _$QrPaymentPageInitiated {
  const factory QrPaymentPageInitiated(int amount) = _QrPaymentPageInitiated;
}
