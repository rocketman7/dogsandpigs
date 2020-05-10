import 'package:flutter/material.dart';

import '../models/model_asset.dart';
import '../screens/screen_voteAction.dart';
import '../screens/screen_voteResult.dart';

List<Widget> makeVoteList(BuildContext context, List<Asset> assets) {
  List<Widget> results = [];

  for (var i = 0; i < assets.length; i++) {
    results.add(GestureDetector(
      onTap: () {
        if (assets[i].hasVote) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => VoteResultScreen(i)));
              //MaterialPageRoute(builder: (context) => VoteResultScreen(), fullscreenDialog: true));
        } else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => VoteActionScreen(i)));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Stack(
          children: <Widget>[
            //자산별 기본 배경색 깔고
            Container(
              color: assets[i].assetColor,
            ),
            //여기 자산별 이미지 쌓고
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  color: assets[i].assetColor,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 100.0 - 5 - 5,
                    width: MediaQuery.of(context).size.width - 100 - 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              '${assets[i].assetName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '♡️${assets[i].totalVoteNum}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Text(
                          '자산에 대한 설명',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Text(
                              '자산의 투표 마감 시간',
                              style: TextStyle(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              '몇 연승 중!',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //맨 마지막에 투표여부에 따라 투명한 투표완료 박스로 자산별 이미지 덮어주고
            assets[i].hasVote
                ? Container(
              height: 100,
              width: 100,
              color: Colors.black.withOpacity(0.3),
              child: Center(
                  child: Text(
                    '투표완료',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white.withOpacity(0.5)),
                  )),
            )
                : Container(),
          ],
        ),
      ),
    ));
  }

  return results;
}
