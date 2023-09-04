import 'package:flutter/material.dart';

import '../../asset/asset_font.dart';

class PlanTextField extends StatelessWidget {
  const PlanTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return TextField(
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
