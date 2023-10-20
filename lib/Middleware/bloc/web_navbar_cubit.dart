import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'web_navbar_state.dart';

class WebNavbarCubit extends Cubit<WebNavbarInitial> {
  WebNavbarCubit() : super(WebNavbarInitial(
  ));

  void changeState(int Index){
    emit(WebNavbarInitial(tabIndex: Index));
  }
}

