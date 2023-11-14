part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  HistoryModal history;
  HistoryLoaded({required this.history});
}

class HistoryError extends HistoryState {
  String message;
  HistoryError({required this.message});
}
