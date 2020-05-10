import 'package:dogsandpigs/screens/screen_voteList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_asset.dart';

class VoteResultScreen extends StatefulWidget {
  final int index;

  VoteResultScreen(this.index);

  @override
  _VoteResultScreenState createState() => _VoteResultScreenState();
}

class _VoteResultScreenState extends State<VoteResultScreen> {
  int index;

  @override
  void initState() {
    super.initState();

    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    var providerAsset = Provider.of<ProviderAsset>(context);

    return Container(
        child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 18,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VoteListScreen()));
                      },
                    ),
                    elevation: 0.0,
                    backgroundColor: providerAsset.assetColor(index),
                  ),
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text('투표결과 그래프')),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text('상승댓글 영역')),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Center(child: Text('하락댓글 영역')),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
