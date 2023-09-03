import 'package:flutter/material.dart';

import '../../asset/asset_color.dart';
import '../../asset/asset_font.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '결과보고서',
                style: AssetFont.bareunBatang700.copyWith(
                  fontSize: 40,
                  letterSpacing: 10,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7 - 15,
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
                    top: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 3, 0, 3),
                  child: Text(
                    //'작성일자: ${dateTime.year}.${dateTime.month}.${dateTime.day}.${dateTime.weekday}',
                    '작성일자: 2023.09.08.화',
                    style: AssetFont.bareunBatang500.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3 - 15,
              height: 85,
              decoration: BoxDecoration(
                color: AssetColor.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '제출하고\n나가기',
                  style: AssetFont.bareunBatang500.copyWith(
                    fontSize: 20,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
