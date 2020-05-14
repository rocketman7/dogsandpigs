import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle(){
    _isJoin = !_isJoin; // 실행될 때마다 isJoin bool 변경
    notifyListeners(); // 이걸 실행하면 ChangeNotifierProvider를 통해서 제공된 데이터를 사용하고 있는 위젯에게 알림을 보냄
  }
}