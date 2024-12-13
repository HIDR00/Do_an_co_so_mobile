import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app.dart';

@Injectable()
class MenuDetailBloc extends BaseBloc<MenuDetailEvent, MenuDetailState> {
  MenuDetailBloc(this._repository) : super(const MenuDetailState()) {
    on<MenuDetailPageInitiated>(
      _onMenuDetailPageInitiated,
      transformer: log(),
    );
  }

  final Repository _repository;

  FutureOr<void> _onMenuDetailPageInitiated(
    MenuDetailPageInitiated event,
    Emitter<MenuDetailState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final lMenu = await _repository.getItemMenu();
      emit(state.copyWith(lMenu: lMenu));
    });
  }
}
