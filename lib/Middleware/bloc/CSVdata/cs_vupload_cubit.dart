import 'dart:convert';
import 'dart:io';
import 'package:data_hub/Middleware/constants/ApiPaths.dart';
import 'package:data_hub/Models/graphmodals.dart';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cs_vupload_state.dart';

class CsVuploadCubit extends Cubit<CsVuploadState> {
  CsVuploadCubit() : super(CsVuploadInitial());

  void uploadFile(File csv, Map<String, String> data) async {
    emit(CsVuploadUploading());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + uploadPath));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('file', csv.path));

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = ResponseGraphModal.fromJson(
            json.decode(await response.stream.bytesToString()));

        emit(
          CsVuploadDataRecieve(
            data: res,
          ),
        );
      } else {
        throw Exception(await response.stream.bytesToString());
      }
    } on Exception catch (_) {
      emit(CsVuploadError());
    }

    // try {
    //   var res = await request.send();
    //   var result = await http.Response.fromStream(res);
    //   print("status code - ${result.statusCode}");
    //   if (result.statusCode == 200) {
    //     print(result.body);
    //     var resi = ResponseGraphModal.fromJson(
    //       json.decode(result.body),
    //     );
    //     print(resi.rawPeakX!.length);
    //     print(resi.rawTimeX!.length);
    //     // emit(
    //     //   CsVuploadDataRecieve(
    //     //     data: ResponseGraphModal.fromJson(
    //     //       json.decode(result.body),
    //     //     ),
    //     //   ),
    //     // );
    //   }
    // } catch (e) {
    //   //emit(CsVuploadError());
    // }
  }

  void uploadWebFile(List<List<dynamic>> webData, Map<String, String> data) async {
  emit(CsVuploadUploading());

  var request = http.MultipartRequest('POST', Uri.parse(baseUrl + uploadPath));
  request.fields.addAll(data);

  String csvContent = convertWebDataToCSV(webData);

  File tempCsvFile = File('temp_web_data.csv');
  await tempCsvFile.writeAsString(csvContent);

  request.files.add(await http.MultipartFile.fromPath('file', tempCsvFile.path));

  try {
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = ResponseGraphModal.fromJson(
          json.decode(await response.stream.bytesToString()));

      emit(
        CsVuploadDataRecieve(
          data: res,
        ),
      );
    } else {
      throw Exception(await response.stream.bytesToString());
    }
  } on Exception catch (_) {
    emit(CsVuploadError());
  }
}

String convertWebDataToCSV(List<List<dynamic>> webData) {
  StringBuffer csvBuffer = StringBuffer();
  for (List<dynamic> row in webData) {
    csvBuffer.write(row.join(',') + '\n');
  }
  return csvBuffer.toString();
}

}
