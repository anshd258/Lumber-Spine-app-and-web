part of 'getcsv_cubit.dart';

@immutable
abstract class GetcsvState {}

class GetcsvInitial extends GetcsvState {}

class GetcsvLoading extends GetcsvState {}

class GetcsvLoaded extends GetcsvState {
  final File file;
  GetcsvLoaded({required this.file});
}

class GetcsvLoadedWeb extends GetcsvState {
  final Uint8List fileData;
  final String fileName;
  GetcsvLoadedWeb({required this.fileData,required this.fileName});
}

class GetcsvError extends GetcsvState {
  final String message;
  GetcsvError({required this.message});
}

// class GetcsvError extends GetcsvState {}
