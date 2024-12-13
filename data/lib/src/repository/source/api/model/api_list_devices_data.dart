import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data.dart';

part 'api_list_devices_data.freezed.dart';
part 'api_list_devices_data.g.dart';

@freezed
class ApiListDevicesData with _$ApiListDevicesData {

	const ApiListDevicesData._();

	factory ApiListDevicesData({
		@JsonKey(name: 'data') List<ApiDeviceData>? data,
	}) = _ApiListDevicesData;

	factory ApiListDevicesData.fromJson(Map<String, dynamic> json) => _$ApiListDevicesDataFromJson(json);
}
