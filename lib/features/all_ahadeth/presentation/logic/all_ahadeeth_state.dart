part of 'all_ahadeeth_cubit.dart';

@immutable
sealed class AllAhadeethState {}

final class AllAhadeethInitial extends AllAhadeethState {}
final class AllAhadeethLoading extends AllAhadeethState {}
final class AllAhadeethSuccess extends AllAhadeethState {
  final List<HadithCategory> data;

  AllAhadeethSuccess(this.data);
}
final class AllAhadeethError extends AllAhadeethState {
  final String message;

  AllAhadeethError(this.message);
}

