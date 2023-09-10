import 'package:flutter/material.dart';
import 'package:todo_report/ui/todo_report/stamp_container.dart';
import 'package:todo_report/ui/todo_report/todo_text_field.dart';

import '../../asset/asset_color.dart';
import '../../asset/asset_font.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: const BorderSide(
          color: AssetColor.greyDivider,
          width: 1,
        ),
        outside: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(0.65),
        1: FlexColumnWidth(0.35),
      },
      children: [
        TableRow(
          children: [
            SizedBox(
              height: 28,
              child: Center(
                child: Text(
                  '계획 및 일정',
                  style: AssetFont.bareunBatang600.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 28,
              child: Center(
                child: Text(
                  '수행결과',
                  style: AssetFont.bareunBatang600.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        ...List.generate(
          10,
          (index) => TableRow(
            children: [
              TodoTextField(
                index: index,
              ),
              StampContainer(
                index: index,
              ),
            ],
          ),
        )
      ],
    );
  }
}
