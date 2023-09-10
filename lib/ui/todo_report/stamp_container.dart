import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_report/asset/asset_color.dart';
import 'package:todo_report/providers/todo_report_provider.dart';
import 'package:todo_report/util/enum.dart';
import 'package:todo_report/util/ext.dart';

import '../../util/const.dart';

class StampContainer extends StatelessWidget {
  const StampContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    TodoReportProvider todoReportNotifier = TodoReportProvider();
    FocusScope.of(context).requestFocus(FocusNode());
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0;
        }),
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          return Colors.transparent;
        }),
        foregroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          return Colors.transparent;
        }),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return StampBottomSheetDialog(
              stampProvider: todoReportNotifier,
              index: index,
            );
          },
        );
      },
      child: ListenableBuilder(
        listenable: todoReportNotifier,
        builder: (BuildContext context, Widget? child) {
          String? stamp = todoReportNotifier.todoReportList[index].stamp;
          if (stamp == null || stamp.contains('도장없음')) {
            return const SizedBox.shrink();
          }
          return stamp.getImgType() == ImgType.svg
              ? SvgPicture.asset(
                  stamp,
                  width: 40,
                  height: 45,
                )
              : Image.asset(
                  stamp,
                  width: 40,
                  height: 45,
                );
        },
      ),
    );
  }
}

class StampBottomSheetDialog extends StatelessWidget {
  const StampBottomSheetDialog({
    super.key,
    required this.stampProvider,
    required this.index,
  });

  final TodoReportProvider stampProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Container(
      color: AssetColor.greyDialogBg,
      height: 235,
      width: MediaQuery.of(context).size.width - 30,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Scrollbar(
          trackVisibility: true,
          thumbVisibility: true,
          controller: scrollController,
          thickness: 3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              mainAxisSpacing: 5,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 4,
              children: List.generate(
                stampList.length,
                (stampDialogItemIndex) {
                  return GestureDetector(
                    onTap: () {
                      stampProvider.editTodoReport(
                        stampProvider.todoReportList[index].copyWith(
                          stamp: stampList[stampDialogItemIndex],
                        ),
                        index,
                      );
                      Navigator.pop(context);
                    },
                    child: stampList[stampDialogItemIndex].getImgType() ==
                            ImgType.svg
                        ? SvgPicture.asset(
                            stampList[stampDialogItemIndex],
                          )
                        : Image.asset(
                            stampList[stampDialogItemIndex],
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
