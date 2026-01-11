part of 'all_duas_cate_cubit.dart';

@immutable
class AllDuasCateState {
  bool isLoading;
  List<Adhkar> data;
  String? error;
  AllDuasCateState({required this.isLoading, required this.data, this.error});

  factory AllDuasCateState.initial() {
    return AllDuasCateState(
      data: [],
      isLoading: false,
      error: null,
    );
  }

  AllDuasCateState copyWith({
    List<Adhkar>? data,
    bool? isLoading,
    String? error,
  }) {
    return AllDuasCateState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

