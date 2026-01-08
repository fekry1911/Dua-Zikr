part of 'get_dua_cubit.dart';

@immutable
sealed class GetDuaState {}

final class GetDuaInitial extends GetDuaState {}
final class GetDuaLoading extends GetDuaState {}
final class GetDuaSuccess extends GetDuaState {
  final List<Dua> duas;
  GetDuaSuccess(this.duas);
}
final class GetDuaError extends GetDuaState {
  final String message;
  GetDuaError(this.message);
}


