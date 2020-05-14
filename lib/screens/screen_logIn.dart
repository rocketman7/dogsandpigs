import 'package:dogsandpigs/data/join_or_login.dart';
import 'package:dogsandpigs/helper/login_background.dart' show LoginBackground;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size devSize =
        MediaQuery.of(context).size; //화면 사이즈 가져오기, final 키워드로 생성하면 변경이 안됨.
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          size: devSize,
          painter:
              LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          //Column이면 차례로 쌓이게 됨.
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _logoImage(), // 로그인 main Image
            Stack(
              children: <Widget>[
                _inputForm(devSize),
                // 로그인 Input Form
                _authButton(devSize), // 로그인 Button
              ],
            ),
            Container(
              height: devSize.height * 0.1,
            ),
            Consumer<JoinOrLogin>(
              builder: (context, joinOrLogin, child) =>
                  GestureDetector(
                      onTap: () {
                        joinOrLogin.toggle();
                      },
                      child: Text(joinOrLogin.isJoin?"이미 회원이신가요? 로그인하세요!":"아직 오늘의 개돼지 회원이 아니신가요? 회원가입하세요!",
                          style:
                              TextStyle(fontSize: 13, color:joinOrLogin.isJoin?Colors.red:Colors.blueGrey))),
            ),
            Container(
              height: devSize.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  Widget _inputForm(Size devSize) {
    return Padding(
      padding: EdgeInsets.all(devSize.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle), labelText: "Email"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "이메일을 입력해주세요";
                    }
                    return null;
                  },
                ), // 이메일
                TextFormField(
                  obscureText: true,
                  controller: _pwdController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key), labelText: "Password"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ), // 비밀번호
                Container(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Consumer<JoinOrLogin>(
                    builder: (context, value, child) => Opacity(
                      opacity: value.isJoin?0:1,
                        child: Text("비밀번호를 잃어버리셨나요?", style: TextStyle(fontSize: 13))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _authButton(Size devSize) => Positioned(
        left: devSize.width * 0.15,
        right: devSize.width * .15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
              child: Text(joinOrLogin.isJoin?"회원가입":"로그인",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: joinOrLogin.isJoin?Colors.red:Colors.indigo,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  joinOrLogin.isJoin?_register(context):_login(context);
                }
              },
            ),
          ),
        ),
      );

  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _pwdController.text);
    final FirebaseUser user = result.user;

    if(user == null){
      final snackBar = SnackBar(content: Text("Please try again later"),);
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _pwdController.text);
    final FirebaseUser user = result.user;

    if(user == null){
      final snackBar = SnackBar(content: Text("Please try again later"),);
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  Widget _logoImage() => Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                  placeholder:
                      "assets/loading.gif", // loading.gif 가 pubspec.yaml에 추가돼있어야 함
                  image:
                      "http://storage.enuri.info/pic_upload/knowbox2/07210923620180618c3f03826-aa73-46e1-a272-45a97a36e5fe.gif"),
            ),
          ),
        ),
      );
}
// context: 앱이 돌아가고 있는 정보, 문맥
// 전체선택하고 Cmd+alt+l -> 코드정리
