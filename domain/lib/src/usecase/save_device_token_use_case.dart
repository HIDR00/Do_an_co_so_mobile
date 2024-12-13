import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'save_device_token_use_case.freezed.dart';

@Injectable()
class SaveDeviceTokenUseCase extends BaseFutureUseCase<SaveDeviceTokenInput, SaveDeviceTokenOutput> {
  const SaveDeviceTokenUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<SaveDeviceTokenOutput> buildUseCase(SaveDeviceTokenInput input) async {
    await _repository.createDevicesToken(input.deviceToken);

    return const SaveDeviceTokenOutput();
  }
}

@freezed
class SaveDeviceTokenInput extends BaseInput with _$SaveDeviceTokenInput {
  const factory SaveDeviceTokenInput({
    required String deviceToken,
  }) = _SaveDeviceTokenInput;
}

@freezed
class SaveDeviceTokenOutput extends BaseOutput with _$SaveDeviceTokenOutput {
  const SaveDeviceTokenOutput._();

  const factory SaveDeviceTokenOutput() = _SaveDeviceTokenOutput;
}
