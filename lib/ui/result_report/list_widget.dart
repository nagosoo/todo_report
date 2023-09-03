import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result_report/asset/asset_color.dart';
import 'package:result_report/asset/asset_font.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: const BorderSide(
          color: AssetColor.grey2,
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
          MediaQuery.of(context).size.height * 0.6 ~/ 50,
          (index) => const TableRow(
            children: [
              PlanContainer(),
              PlanContainer(),
            ],
          ),
        )
      ],
    );
  }
}

class PlanContainer extends StatelessWidget {
  const PlanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines:2,
        style: AssetFont.mapoAgape400.copyWith(
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,

        ),
      ),
    );
  }
}
