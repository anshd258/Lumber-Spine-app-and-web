import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cs_vupload_state.dart';

class CsVuploadCubit extends Cubit<CsVuploadState> {
  CsVuploadCubit() : super(CsVuploadInitial());
}
