import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_list_table.freezed.dart';


@freezed
class MListTable with _$MListTable {
  const factory MListTable({
    @Default(<MTable>[]) List<MTable> lMTable,
  }) = _MListTable;
}

@freezed
class MTable with _$MTable {
  const factory MTable({
    @Default(-1) int id,
    @Default('') String status,
  }) = _MTable;
}