import 'dart:io';

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

  Future<void> getWebFile(dynamic file) async {
    try {
      if (file is List<int>) {
        final content = String.fromCharCodes(file);
        final rowsAsListOfValues = const CsvToListConverter().convert(content);

        emit(GetcsvLoadedWeb(fileData: rowsAsListOfValues));
      } else {
        emit(GetcsvError(message: 'Invalid file format'));
      }
    } catch (e) {
      emit(GetcsvError(message: e.toString()));
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
