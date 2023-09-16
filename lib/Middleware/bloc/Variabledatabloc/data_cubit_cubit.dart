import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_cubit_state.dart';

class DataCubitCubit extends Cubit<DataCubitState> {
  DataCubitCubit() : super(DataCubitInitial());
  void getTdTm(String td, String tm) {
    emit(DataCubitupdated(td: td, tm: tm));
  }

 
}
