import 'package:flutter/material.dart';

class Asset {
  //여기에는 자산 하나하나의 고유한 속성에 대한 변수를 선언
  final String assetName;
  final Color assetColor;

  //여기에는 자산 하나하나의 고유한 속성 보다는 변할 수 있는 값들에 대해 선언(ex.투표수는 유저&다른 유저에 의해 계속 변함)
  int _totalVoteNum;
  bool _hasVote;

  //아래처럼 Map 형태로 값 입력할 수 있게.
  Asset.fromMap(Map<String, dynamic> map)
      : assetName = map['assetName'],
        assetColor = map['assetColor'],
        _totalVoteNum = map['_totalVoteNum'],
        _hasVote = map['_hasVote'];

  //각 _ 변수들의 getter 를 아래에 선언
  int get totalVoteNum => _totalVoteNum;
  bool get hasVote => _hasVote;

  //각 _ 변수들의 setter 들을 아래에 선언
  void incrementVoteNum() {
    _totalVoteNum++;
  }

  void voteDone(){
    _hasVote = true;
  }
}

// provider 를 선언. 우리의 provider 는 asset 들의 List 가 뼈대를 이룸
class ProviderAsset with ChangeNotifier {
  //Asset 은 여러개 있을 것이므로 List 로 선언
  List<Asset> _providerAsset;

  //초기 Asset 의 리스트를 넘겨준다. provider asset class 초기화할 때
  ProviderAsset(List<Asset> initAsset) {
    _providerAsset = initAsset;
  }

  //각 _ 변수들의 getter 들을 아래에 선언
  List<Asset> get providerAsset => _providerAsset;

  String assetName(int index){
    return _providerAsset[index].assetName;
  }
  Color assetColor(int index){
    return _providerAsset[index].assetColor;
  }

  //Asset 리스트 중 특정 index 의 각 _ 변수들을 setter 할 때 아래와 같이 복제해주는 형태로 만든다.
  void incrementVoteNum(int index) {
    _providerAsset[index].incrementVoteNum();
    notifyListeners();
  }

  void voteDone(int index) {
    _providerAsset[index].voteDone();
    notifyListeners();
  }
}
