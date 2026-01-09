import '../../domain/entity/hadeeth_data.dart';

class AhadeethsState {
  final List<HadeethData> hadeeths;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final String? error;

  const AhadeethsState({
    this.hadeeths = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.error,
  });

  AhadeethsState copyWith({
    List<HadeethData>? hadeeths,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    String? error,
  }) {
    return AhadeethsState(
      hadeeths: hadeeths ?? this.hadeeths,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }
}
