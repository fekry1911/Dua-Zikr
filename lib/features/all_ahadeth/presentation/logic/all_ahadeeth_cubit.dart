import 'package:bloc/bloc.dart';
import 'package:dua_zekr/features/all_ahadeth/domain/get_ahadeeth_list.dart';
import 'package:meta/meta.dart';

import '../../../home/data/models/hadith_category.dart';

part 'all_ahadeeth_state.dart';

class AllAhadeethCubit extends Cubit<AllAhadeethState> {
  GetAhadeethList getAhadeethList;

  AllAhadeethCubit(this.getAhadeethList) : super(AllAhadeethInitial());

  void getAllAhadeeth() async {
    emit(AllAhadeethLoading());
    var result = await getAhadeethList.getAllAhadeeth();
    result.fold(
      (failure) {
        emit(AllAhadeethError(failure.message));
      },
      (data) {
        print(data.length);
        emit(AllAhadeethSuccess(data));
      },
    );
  }
}
