import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'search.dart';

@Injectable()
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc(this._repository) : super(const SearchState()) {
    on<SearchPageInitiated>(
      _onSearchPageInitiated,
      transformer: log(),
    );
  }

  final Repository _repository;
  FutureOr<void> _onSearchPageInitiated(SearchPageInitiated event, Emitter<SearchState> emit) {
    return runBlocCatching(action: () async {
      final result = await _repository.getTables();
      emit(state.copyWith(lTable: result.lMTable));
    },);
  }
}
