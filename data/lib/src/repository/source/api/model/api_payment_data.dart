import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_payment_data.freezed.dart';
part 'api_payment_data.g.dart';

@freezed
class ApiPaymentData with _$ApiPaymentData {
  const factory ApiPaymentData({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') String? data,
  }) = _ApiPaymentData;

  factory ApiPaymentData.fromJson(Map<String, dynamic> json) =>
      _$ApiPaymentDataFromJson(json);
}
