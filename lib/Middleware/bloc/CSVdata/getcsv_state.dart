part of 'getcsv_cubit.dart';

@immutable
abstract class GetcsvState {}

class GetcsvInitial extends GetcsvState {}

class GetcsvLoading extends GetcsvState {}

class GetcsvLoaded extends GetcsvState {
  File file;
  GetcsvLoaded({required this.file});
}

class GetcsvError extends GetcsvState {}
