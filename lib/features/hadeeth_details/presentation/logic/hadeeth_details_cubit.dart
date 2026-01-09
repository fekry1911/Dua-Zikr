import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/hadeeth_data.dart';
import '../../domain/repo/get_hadeeth_details.dart';

part 'hadeeth_details_state.dart';

class HadeethDetailsCubit extends Cubit<HadeethDetailsState> {
  final GetHadeethDetails getHadeethDetails;

  HadeethDetailsCubit(this.getHadeethDetails)
    : super(HadeethDetailsState(isLoading: false, data: null, error: null));

  Future<void> getHadeethDetailsData(String id) async {
    emit(state.copyWith(isLoading: true, clearError: true));

    final result = await getHadeethDetails.getHadeethDetails(id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure.message,
            clearData: true,
          ),
        );
      },
      (data) {
        emit(state.copyWith(isLoading: false, data: data, clearError: true));
      },
    );
  }
}
