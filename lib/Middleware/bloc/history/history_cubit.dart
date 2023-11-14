import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:data_hub/Middleware/bloc/Repository/authrepo.dart';
import 'package:data_hub/Middleware/constants/ApiPaths.dart';
import 'package:data_hub/Models/historymodal.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  localStorage _storage;
  HistoryCubit(this._storage) : super(HistoryInitial());
  void getHistory() async {
    emit(HistoryLoading());
    var headers1 = {
      'Content-Type': 'application/json',
      'userID': 'JzuXZ3fzW3Qpt1HmjPlcA59EBLu2'
    };
    http.Response res =
        await http.get(Uri.parse(baseUrl + history), headers: headers1);
    if (res.statusCode == 200) {
      List response = json.decode(res.body);
      HistoryModal data = HistoryModal.fromJson(response);

      emit(HistoryLoaded(history: data));
    } else {
      emit(HistoryError(message: res.body));
    }
  }
}
