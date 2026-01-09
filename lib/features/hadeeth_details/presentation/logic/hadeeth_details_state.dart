part of 'hadeeth_details_cubit.dart';

@immutable
class HadeethDetailsState {
  bool isLoading;
  HadeethDtailsData? data;
  String? error;

  HadeethDetailsState({
    required this.isLoading,
    required this.data,
    required this.error,
  });

  HadeethDetailsState copyWith({
    bool? isLoading,
    HadeethDtailsData? data,
    String? error,
    bool clearError = false,
    bool clearData = false,
  }) {
    return HadeethDetailsState(
      isLoading: isLoading ?? this.isLoading,
      data: clearData ? null : (data ?? this.data),
      error: clearError ? null : (error ?? this.error),
    );
  }

}
