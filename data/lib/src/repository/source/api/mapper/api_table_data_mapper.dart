import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiTableDataMapper extends BaseDataMapper<ApiTableData, MTable> {
  @override
  MTable mapToEntity(ApiTableData? data) {
    return MTable(
      id: data?.id ?? -1,
      status: data?.status ?? '',
    );
  }
  MListTable mapToEntityList(ApiListTableData? dataList) {
    return MListTable(
      lMTable: dataList?.lApiTableData?.map((data) => mapToEntity(data)).toList() ?? []
    );
  }
}
