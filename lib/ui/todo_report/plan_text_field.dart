import 'package:flutter/material.dart';

import '../../asset/asset_font.dart';

class PlanTextField extends StatelessWidget {
  const PlanTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return SizedBox(
      height: 50,
      child: TextField(
        controller: textEditingController,
        maxLines: 2,
        maxLength: 22,
        style: AssetFont.mapoAgape400.copyWith(
          fontSize: 20,
          overflow: TextOverflow.ellipsis,
          height: 1,
        ),
        decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(5),
            counterText: ''),
      ),
    );
  }
}
