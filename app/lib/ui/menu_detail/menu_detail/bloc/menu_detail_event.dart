import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';
  
part 'menu_detail_event.freezed.dart';

abstract class MenuDetailEvent extends BaseBlocEvent {
  const MenuDetailEvent();
}

@freezed
class MenuDetailPageInitiated extends MenuDetailEvent with _$MenuDetailPageInitiated {
  const factory MenuDetailPageInitiated() = _MenuDetailPageInitiated;
}
