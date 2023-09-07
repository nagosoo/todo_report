import 'package:flutter/material.dart';

import '../../asset/asset_font.dart';

class TodoTextField extends StatefulWidget {
  const TodoTextField({super.key, required this.todoTextFieldKey});

  final GlobalKey<TodoTextFieldState> todoTextFieldKey;

  @override
  State<TodoTextField> createState() => TodoTextFieldState();
}

class TodoTextFieldState extends State<TodoTextField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.todoTextFieldKey,
      minLines: 1,
      maxLines: 2,
      controller: textEditingController,
      textAlign: TextAlign.center,
      style: AssetFont.mapoAgape400.copyWith(
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
