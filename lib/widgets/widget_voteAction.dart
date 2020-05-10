import 'package:dogsandpigs/screens/screen_voteList.dart';
import 'package:dogsandpigs/screens/screen_voteResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_asset.dart';

Widget voteActionMain(BuildContext context, int index) {
  var providerAsset = Provider.of<ProviderAsset>(context);

  return GestureDetector(
    onDoubleTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoteListScreen()));
    },
    child: Container(
      color: providerAsset.assetColor(index),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            '오른다',
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
          Text('⬆︎'),
          Spacer(),
          Text(
            '${providerAsset.assetName(index)}',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text('자산의 정보 표시}'),
          Container(
            width: MediaQuery.of(context).size.width - 60,
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '투표마감 : 5월 8일 23:59까지',
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text('투표기준 : 09:00 시가 대비 15:30 종가', style: TextStyle(color: Colors.white70),)
                ],
              ),
            ),
          ),
          Spacer(),
          Text('⬇︎'),
          Spacer(),
          Text(
            '내린다',
            style: TextStyle(fontSize: 20),
          ),
          Spacer(),
        ],
      ),
    ),
  );
}


Widget voteActionChoose(BuildContext context, int index, bool upOrDown) {
  var providerAsset = Provider.of<ProviderAsset>(context);

  return GestureDetector(
    onDoubleTap: () {
      providerAsset.voteDone(index);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoteResultScreen(index)));
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            providerAsset.assetColor(index),
            upOrDown ? Colors.redAccent : Colors.blueAccent
          ],
          begin: upOrDown ? Alignment.topCenter : Alignment.bottomCenter,
          end: upOrDown ? Alignment.bottomCenter : Alignment.topCenter,
          //stops: [0.5, 1]
        ),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            '${providerAsset.assetName(index)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          upOrDown ? Text('상승에 투표') : Text('하락에 투표'),
          Text('(더블탭하여 확정하기)'),
          Spacer()
        ],
      ),
    )
  );
}