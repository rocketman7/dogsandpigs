import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_asset.dart';
import '../widgets/widget_voteAction.dart';

class VoteActionScreen extends StatefulWidget {
  final int index;

  VoteActionScreen(this.index);

  @override
  _VoteActionScreenState createState() => _VoteActionScreenState();
}

class _VoteActionScreenState extends State<VoteActionScreen> {
  int index;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    index = widget.index;
    pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    var providerAsset = Provider.of<ProviderAsset>(context);

    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          voteActionChoose(context, index, false),
          voteActionMain(context, index),
          voteActionChoose(context, index, true),
        ],
      ),
    );
  }
}
