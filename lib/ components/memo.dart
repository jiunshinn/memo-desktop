import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../provider/memo_provider.dart';
import '../screens/memo_edit.dart';

class Memo extends StatefulWidget {
  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemoProvider>(builder: (context, memoProvider, child) {
      String selectTitle =
          Provider.of<MemoProvider>(context).memo.title.toString();
      String selectContent =
          Provider.of<MemoProvider>(context).memo.content.toString();
      DateTime selectCreatedAt =
          Provider.of<MemoProvider>(context).memo.createdAt;

      String readableCreatedAt = DateFormat("yyyy년 MM월 dd일 HH시 mm분")
          .format(selectCreatedAt)
          .toString();
      return Expanded(
        flex: 3,
        child: memoProvider.memoList.isEmpty
            ? Container()
            : Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          selectTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MemoEdit(
                                  memoModel: memoProvider.memo,
                                ),
                              ),
                            );
                            setState(() {});
                          },
                          child: Icon(Icons.edit),
                        ),
                        const SizedBox(width: 30),
                        InkWell(
                          onTap: () {
                            memoProvider.deleteMemo(memoProvider.memo);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      selectContent,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      "작성날짜 : " + readableCreatedAt,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
      );
    });
  }
}
