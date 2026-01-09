import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/hadeeth_data.dart';
import '../../domain/repos/get_ahdeeth_of_category.dart';
import 'ahadeeths_state.dart';


class AhadeethsCubit extends Cubit<AhadeethsState> {
  final GetAhdeethOfCategory repo;

  AhadeethsCubit(this.repo) : super(const AhadeethsState());

  int _page = 1;
  final int _perPage = 20;
  bool _isFetching = false;

  Future<void> loadFirstPage(String categoryId) async {
    _page = 1;
    emit(state.copyWith(isLoading: true, error: null));

    final result = await repo.getAllHadeethOfCategory(
      id: categoryId,
      page: _page.toString(),
      per_page: _perPage.toString(),
    );

    result.fold(
          (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
          (data) => emit(state.copyWith(
        hadeeths: data,
        isLoading: false,
        hasReachedMax: data.length < _perPage,
      )),
    );
  }

  Future<void> loadMore(String categoryId) async {
    if (state.hasReachedMax || _isFetching) return;

    _isFetching = true;
    emit(state.copyWith(isLoadingMore: true));

    _page++;

    final result = await repo.getAllHadeethOfCategory(
      id: categoryId,
      page: _page.toString(),
      per_page: _perPage.toString(),
    );

    result.fold(
          (failure) {
        _isFetching = false;
        emit(state.copyWith(isLoadingMore: false));
      },
          (data) {
        _isFetching = false;
        emit(state.copyWith(
          hadeeths: List.of(state.hadeeths)..addAll(data),
          isLoadingMore: false,
          hasReachedMax: data.length < _perPage,
        ));
      },
    );
  }
}
