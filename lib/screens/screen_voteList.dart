import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widget_makeVoteList.dart';
import '../models/model_asset.dart';

class VoteListScreen extends StatefulWidget {
  @override
  _VoteListScreenState createState() => _VoteListScreenState();
}

class _VoteListScreenState extends State<VoteListScreen> {

  @override
  Widget build(BuildContext context) {
    var providerAsset = Provider.of<ProviderAsset>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: makeVoteList(context, providerAsset.providerAsset),
        ),
      ),
    );
  }
}
