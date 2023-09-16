part of 'data_cubit_cubit.dart';

@immutable
abstract class DataCubitState {
  String? tm;
  String? td;
  String? N;
  String? i;
  String? n;
  String? c;
  String? b;
  DataCubitState({this.N, this.b, this.c, this.i, this.n, this.td, this.tm});
}

class DataCubitInitial extends DataCubitState {
  DataCubitInitial(
      {super.N, super.b, super.c, super.i, super.n, super.td, super.tm});
}

class DataCubitupdated extends DataCubitState {
  DataCubitupdated(
      {super.N, super.b, super.c, super.i, super.n, super.td, super.tm});
}
