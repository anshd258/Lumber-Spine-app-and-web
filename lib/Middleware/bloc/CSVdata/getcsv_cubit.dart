import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:csv/csv.dart';

part 'getcsv_state.dart';

// class GetcsvCubit extends Cubit<GetcsvState> {
//   GetcsvCubit() : super(GetcsvInitial());

//   Future<void> getFile() async {
//     emit(GetcsvLoading());
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         type: FileType.custom,
//         allowedExtensions: ['csv']).onError((error, stackTrace) {
//       emit(GetcsvError());
//       print('****************************************************');
//       return null;
//     });

//     if (result != null) {
//       print('****************************************************');
//       String? filePath = result.files.single.path;
//       if (filePath != null) {
//         emit(GetcsvLoaded(file: File(result.files.single.path!)));
//       }
//     }
//   }
// }

class GetcsvCubit extends Cubit<GetcsvState> {
  GetcsvCubit() : super(GetcsvInitial());

  Future<void> getWebFile() async {
    emit(GetcsvLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['csv']).onError((error, stackTrace) {
      emit(GetcsvError(message: 'Invalid file format'));
      return null;
    });

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
  String fileName = result.files.first.name;
      
      if (fileBytes != null) {
        emit(GetcsvLoadedWeb(fileData: fileBytes, fileName: fileName));
      }
    }
  }

  Future<void> getFile() async {
    emit(GetcsvLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['csv']).onError((error, stackTrace) {
      emit(GetcsvError(message: 'Invalid file format'));
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
