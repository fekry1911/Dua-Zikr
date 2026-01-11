import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/adhkar_model.dart';
import '../../domain/repos/get_duas_cate.dart';

part 'all_duas_cate_state.dart';

class AllDuasCateCubit extends Cubit<AllDuasCateState> {
  GetDuasOfCate getDuasOfCate;

  AllDuasCateCubit(this.getDuasOfCate) : super(AllDuasCateState.initial());

  Future<void> getDuas(String assetFile) async {
    emit(state.copyWith(isLoading: true));
    getDuasOfCate
        .getAllDausOfCate(assetFile)
        .then((value) {
          emit(state.copyWith(data: value, isLoading: false));
        })
        .catchError((onError) {
          emit(state.copyWith(error: onError.toString(), isLoading: false));
        });
  }
}
