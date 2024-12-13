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
        final result = await _repository.getCategory();
        final lMenu = await _repository.getItemMenu();
        emit(state.copyWith(isShimmerLoading: true,lCategories: result.data,lMenu: lMenu));
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
        final result = List<Menu>.from(state.lMenuOder)..add(event.menu);
        emit(state.copyWith(lMenuOder: result));
    },
    doOnSubscribe: () async {
      
    },
    doOnEventCompleted: () async {
      
    },
    );
  }
}
