part of 'cs_vupload_cubit.dart';

@immutable
abstract class CsVuploadState {}

class CsVuploadInitial extends CsVuploadState {}

class CsVuploadUploading extends CsVuploadState {}

class CsVuploadDataRecieve extends CsVuploadState {
  ResponseGraphModal data;
  CsVuploadDataRecieve({required this.data});
}

class CsVuploadError extends CsVuploadState {}
