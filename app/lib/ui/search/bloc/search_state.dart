import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_state.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState extends BaseBlocState with _$SearchState {
  const factory SearchState({
    @Default('') String id,
    @Default(<MTable>[]) List<MTable> lTable
  }) = _SearchState;
}
