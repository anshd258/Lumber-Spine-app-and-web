import 'dart:convert';
import 'dart:io';
import 'package:data_hub/Models/graphmodals.dart';
import 'package:http_parser/http_parser.dart';
import 'package:data_hub/Middleware/constants/ApiPaths.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cs_vupload_state.dart';

class CsVuploadCubit extends Cubit<CsVuploadState> {
  CsVuploadCubit() : super(CsVuploadInitial());

  void uploadFile(File csv, Map<String, String> data) async {
    print(csv.path);
    emit(CsVuploadUploading());

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(baseUrl),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        csv.readAsBytes().asStream(),
        csv.lengthSync(),
        filename: csv.path,
        contentType: MediaType("csv", "xls"),
      ),
    );

    request.headers.addAll(headers);
    request.fields.addAll(data);

    try {
      var res = await request.send();
      var result = await http.Response.fromStream(res);
      if (result.statusCode == 200) {
        emit(
          CsVuploadDataRecieve(
            data: ResponseGraphModal.fromJson(
              json.decode(result.body),
            ),
          ),
        );
      }
    } catch (e) {
      //emit(CsVuploadError());
    }
  }
}
