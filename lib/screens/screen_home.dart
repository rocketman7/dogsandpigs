import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screen_voteList.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({this.email});

  final String email;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('대쉬보드 구현 필요'),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VoteListScreen()));
                },
                child: Text('여기 눌러서 투표리스트로 가기'),
              ),
              Center(
                child: FlatButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                }, child: Text("로그아웃")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
