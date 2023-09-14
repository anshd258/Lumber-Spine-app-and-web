import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'getcsv_state.dart';

class GetcsvCubit extends Cubit<GetcsvState> {
  GetcsvCubit() : super(GetcsvInitial());

  Future<void> getFile() async {
    emit(GetcsvLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['csv']).onError((error, stackTrace) {
      emit(GetcsvError());
      return null;
    });

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        emit(GetcsvLoaded(file: File(result.files.single.path!)));
      }
    }
  }
}
