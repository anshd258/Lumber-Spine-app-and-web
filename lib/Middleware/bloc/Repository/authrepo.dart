import 'dart:html';

class localStorage {
  final Storage _localStorage = window.localStorage;
  String? userId ;

  Future save(String id) async {
    _localStorage['user_id'] = id;
    userId = id;
  }

  Future<String?> getId() async {
   userId = _localStorage['user_id'];
   return _localStorage['user_id'];

  } 

  Future invalidate() async {
    _localStorage.clear();
  }
}
