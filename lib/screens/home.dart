import 'package:flutter/material.dart';

import '../ components/memo.dart';
import '../ components/memo_list.dart';
import 'memo_post.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => MemoPost()));

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          MemoList(),
          Memo(),
        ],
      ),
    );
  }
}
