import 'package:flutter/material.dart';

import 'screen_voteList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
