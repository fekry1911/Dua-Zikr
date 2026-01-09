part of 'manage_fav_cubit.dart';

@immutable
class ManageFavState {
  final List<HadeethData> favorites;
  final bool isLoading;
  final String? error;

  const ManageFavState({
    required this.favorites,
    required this.isLoading,
    this.error,
  });

  factory ManageFavState.initial() {
    return const ManageFavState(
      favorites: [],
      isLoading: false,
      error: null,
    );
  }

  ManageFavState copyWith({
    List<HadeethData>? favorites,
    bool? isLoading,
    String? error,
  }) {
    return ManageFavState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
