import 'dart:convert';
import 'dart:io';
import 'package:data_hub/Models/graphmodals.dart';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cs_vupload_state.dart';

class CsVuploadCubit extends Cubit<CsVuploadState> {
  CsVuploadCubit() : super(CsVuploadInitial());

  void uploadFile(File csv, Map<String, String> data) async {
    print(csv.path);
    emit(CsVuploadUploading());

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse("https://af4c-45-112-52-82.ngrok-free.app/upload"),
    // );
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://af4c-45-112-52-82.ngrok-free.app/upload'));
    request.fields.addAll({
      'tm': '0.017252778',
      'td': '8',
      'N': '100',
      'i': '3',
      'n': '5',
      'c': '0.25',
      'b': '25'
    });
    request.files.add(await http.MultipartFile.fromPath('file', csv.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = ResponseGraphModal.fromJson(
          json.decode(await response.stream.bytesToString()));
      print(res.data!.rawPeakX!.length);
      print(res.data!.rawTimeX!.length);
      print(res.data!.rawPeakY!.length);
      print(res.data!.rawTimeY!.length);
      print(res.data!.rawPeakZ!.length);
      print(res.data!.rawTimeZ!.length);
      emit(
        CsVuploadDataRecieve(
          data: res,
        ),
      );
    } else {
      print(response.reasonPhrase);
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
}
