import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/memo_model.dart';
import '../provider/memo_provider.dart';

class MemoEdit extends StatefulWidget {
  MemoModel memoModel;

  MemoEdit({required this.memoModel});

  @override
  State<MemoEdit> createState() => _MemoEditState();
}

class _MemoEditState extends State<MemoEdit> {
  late MemoProvider _memoProvider;

  void editMemo(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController contentController,
      ) {
    if (titleController.text.isNotEmpty) {
      MemoModel editMemo = MemoModel(
        id: widget.memoModel.id,
        title: titleController.text,
        content: contentController.text,
        createdAt: DateTime.now(),
      );
      _memoProvider.editMemo(editMemo);
    }
  }

  @override
  Widget build(BuildContext context) {
    _memoProvider = Provider.of<MemoProvider>(context, listen: false);
    TextEditingController titleController =
    TextEditingController(text: widget.memoModel.title);
    TextEditingController contentController =
    TextEditingController(text: widget.memoModel.content);
    return Scaffold(
      appBar: AppBar(
        title: Text("메모 수정하기"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            editMemo(context, titleController, contentController);
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: '제목',
            ),
          ),
          TextFormField(
            maxLines: null,
            controller: contentController,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '내용',
            ),
          )
        ],
      ),
    );
  }
}