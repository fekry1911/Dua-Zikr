import 'package:bloc/bloc.dart';
import 'package:dua_zekr/features/home/data/models/dua_model.dart';
import 'package:dua_zekr/features/home/domain/repos/get_dua.dart';
import 'package:meta/meta.dart';

part 'get_dua_state.dart';

class GetDuaCubit extends Cubit<GetDuaState> {
  GetDua getDua;

  GetDuaCubit(this.getDua) : super(GetDuaInitial());

  Future<void> getDuaData() async {
    emit(GetDuaLoading());
    final result = await getDua.getDua();
    emit(GetDuaSuccess(result));
  }
}
