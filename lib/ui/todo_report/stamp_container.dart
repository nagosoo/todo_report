import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_report/asset/asset_color.dart';
import 'package:todo_report/providers/stamp_provider.dart';
import 'package:todo_report/util/enum.dart';
import 'package:todo_report/util/ext.dart';

import '../../util/const.dart';

class StampContainer extends StatefulWidget {
  const StampContainer({super.key, required this.stampKey});

  final GlobalKey<StampContainerState> stampKey;

  @override
  State<StampContainer> createState() => StampContainerState();
}

class StampContainerState extends State<StampContainer> {
  StampProvider stampNotifier = StampProvider();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: widget.stampKey,
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
            return StampBottomSheetDialog(stampProvider: stampNotifier);
          },
        );
      },
      child: ListenableBuilder(
        listenable: stampNotifier,
        builder: (BuildContext context, Widget? child) {
          if (stampNotifier.stamp.isNotEmpty) {
            return stampNotifier.stamp.getImgType() == ImgType.svg
                ? SvgPicture.asset(
                    stampNotifier.stamp,
                    width: 40,
                    height: 45,
                  )
                : Image.asset(
                    stampNotifier.stamp,
                    width: 40,
                    height: 45,
                  );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class StampBottomSheetDialog extends StatelessWidget {
  const StampBottomSheetDialog({
    super.key,
    required this.stampProvider,
  });

  final StampProvider stampProvider;

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
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 4,
              children: List.generate(
                stampList.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      stampProvider.chooseStamp(
                        stampList[index],
                      );
                    },
                    child: stampList[index].getImgType() == ImgType.svg
                        ? SvgPicture.asset(
                            stampList[index],
                          )
                        : Image.asset(
                            stampList[index],
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
