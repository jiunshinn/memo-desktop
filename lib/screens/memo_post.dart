import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/models/memo_model.dart';
import 'package:my_first_flutter_app/provider/memo_provider.dart';
import 'package:provider/provider.dart';

class MemoPost extends StatelessWidget {
  late MemoProvider memoProvider;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void noTitleDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: [
                Text("제목을 작성하지 않았습니다."),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "제목을 작성해주세요!",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    memoProvider = Provider.of<MemoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("메모 작성하기"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            if (titleController.text.isNotEmpty) {
              int memoId = memoProvider.memoList.length + 1;
              MemoModel newMemo = MemoModel(
                id: memoId,
                title: titleController.text.toString(),
                content: contentController.text.toString(),
                createdAt: DateTime.now(),
              );
              memoProvider.memoList.add(newMemo);

              Navigator.pop(context);
            } else {
              noTitleDialog(context);
            }
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(labelText: "제목"),
          ),
          TextFormField(
            maxLines: null,
            controller: contentController,
            decoration:
                InputDecoration(labelText: "내용", border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
