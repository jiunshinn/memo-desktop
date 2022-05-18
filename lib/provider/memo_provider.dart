import 'package:flutter/material.dart';

import '../models/memo_model.dart';

class MemoProvider extends ChangeNotifier {
  MemoModel _memo = MemoModel(id: 0, title: "", content: "", createdAt: DateTime.now());

  MemoModel get memo => _memo;

  List<MemoModel> memoList = [];


  void postMemo(MemoModel memo){
    memoList.add(memo);
    notifyListeners();
  }

  void editMemo(MemoModel memo){
    for(int i = 0; i < memoList.length; i++) {
      if (memoList[i].id == memo.id){
        memoList[i] = memo;
      }
    }
    notifyListeners();
  }

  void deleteMemo(MemoModel memo){
    for (int i =0 ; i < memoList.length; i++){
      if(memoList[i].id == memo.id){
        memoList.remove(memo);
      }
    }
    notifyListeners();
  }

  void selectMemo(MemoModel memo){
    _memo = memo;
    notifyListeners();
  }
}