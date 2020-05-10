import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/model_asset.dart';
import 'screens/screen_home.dart';
import 'screens/screen_logIn.dart';


//앱의 기초가 되는 부분. 아래 MainApp 은 혹시 앱 전체를 아우르는 provider 변수가 필요할 경우나(추측),
//전체 테마 등을 변경할 때만 수정하면 될 듯
//바로 MainRoute 를 호출하여 로그인 or 홈화면으로 넘어간다.
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final List<Asset> assets = [
    Asset.fromMap({
      'assetName': '자산1',
      'assetColor': Colors.red[100],
      '_totalVoteNum': 100,
      '_hasVote': false,
    }),
    Asset.fromMap({
      'assetName': '자산2',
      'assetColor': Colors.red[200],
      '_totalVoteNum': 200,
      '_hasVote': true,
    }),
    Asset.fromMap({
      'assetName': '자산3',
      'assetColor': Colors.blueGrey[100],
      '_totalVoteNum': 300,
      '_hasVote': false,
    }),
    Asset.fromMap({
      'assetName': '자산4',
      'assetColor': Colors.amber[200],
      '_totalVoteNum': 9000,
      '_hasVote': false,
    }),
    Asset.fromMap({
      'assetName': '자산5',
      'assetColor': Colors.green[200],
      '_totalVoteNum': 20,
      '_hasVote': false,
    }),
    Asset.fromMap({
      'assetName': '자산6',
      'assetColor': Colors.brown[200],
      '_totalVoteNum': 500,
      '_hasVote': false,
    }),
    Asset.fromMap({
      'assetName': '자산7',
      'assetColor': Colors.indigo[200],
      '_totalVoteNum': 100000,
      '_hasVote': true,
    }),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ProviderAsset(assets))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.black,
        ),
        home: MainRoute(),
      ),
    );
  }
}

//앱이 실행되면 먼저 메인루트인 당 페이지를 호출한다.
//로그인이 되지 않았다면 login screen 을 호출하고,
//로그인이 되었다면 앱의 메인화면인 home screen 을 호출한다(아마도 log in할 때의 data 를 가지고?). 그 후의 모든 화면은 home screen 으로부터 파생되면 될듯???
class MainRoute extends StatelessWidget {
  //나중에 이 부분과 밑 build 안쪽 부분을 실제 로그인 여부를 가릴 수 있는 코드로 수정해준다.
  final bool isLogInSuccess = true;

  @override
  Widget build(BuildContext context) {
    if (isLogInSuccess) {
      return HomeScreen();
    } else {
      return LogInScreen();
    }
  }
}
