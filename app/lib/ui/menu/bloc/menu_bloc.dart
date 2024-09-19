import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'menu.dart';

@Injectable()
class MenuBloc extends BaseBloc<MenuEvent, MenuState> {
  MenuBloc(this._repository) : super(MenuState()) {
    on<MenuPageInitiated>(
      _onMenuPageInitiated,
      transformer: log(),
    );
    on<TabViewAddOrder>(
      _onTabViewAddOrder,
      transformer: log(),
    );
  }
  final Repository _repository;

  FutureOr<void> _onMenuPageInitiated(MenuPageInitiated event, Emitter<MenuState> emit) async {
    return runBlocCatching(
      action: () async {
        final _result = await _repository.getCategory();
        final _lMenu = await _repository.getItemMenu();
        emit(state.copyWith(isShimmerLoading: true,lCategories: _result.data,lMenu: _lMenu));
    },
    doOnSubscribe: () async {
      
    },
    doOnEventCompleted: () async {
      
    },
    );
  }

  FutureOr<void> _onTabViewAddOrder(TabViewAddOrder event, Emitter<MenuState> emit) async {
    return runBlocCatching(
      action: () async {
        final _result = List<Menu>.from(state.lMenuOder);
        _result.add(event.menu);
        emit(state.copyWith(lMenuOder: _result));
    },
    doOnSubscribe: () async {
      
    },
    doOnEventCompleted: () async {
      
    },
    );
  }
}
