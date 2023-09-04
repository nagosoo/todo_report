import 'package:flutter/material.dart';
import 'package:result_report/asset/asset_color.dart';
import 'package:result_report/asset/asset_font.dart';

class EvaluationTextField extends StatelessWidget {
  const EvaluationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 30,
          decoration: const BoxDecoration(
            color: AssetColor.grey,
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: Text(
                '보 완 사 항    및    평 가 ',
                style: AssetFont.bareunBatang600.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: TextField(
            minLines: MediaQuery.of(context).size.height * 0.2 ~/ 20,
            maxLines: MediaQuery.of(context).size.height * 0.2 ~/ 20,
            textAlign: TextAlign.center,
            style: AssetFont.mapoAgape400.copyWith(
              fontSize: 20,
              height: 1,
            ),
          ),
        )
      ],
    );
  }
}
