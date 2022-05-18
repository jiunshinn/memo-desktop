import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_flutter_app/data/memo_data.dart';
import 'package:my_first_flutter_app/provider/memo_provider.dart';
import 'package:provider/provider.dart';

class MemoList extends StatelessWidget {
  late MemoProvider _memoProvider;

  @override
  Widget build(BuildContext context) {
    _memoProvider = Provider.of<MemoProvider>(context, listen: true);

    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.greenAccent,
        child: ListView(
          children: [
            ..._memoProvider.memoList.reversed.map(
              (item) {
                String readableCreatedAt =
                    DateFormat("yyyy년MM월dd일").format(item.createdAt);
                return InkWell(
                  onTap: () {
                    _memoProvider.selectMemo(
                      item
                    );
                  },
                  child: Column(
                    children: [
                      Text(item.title),
                      Text(readableCreatedAt),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
