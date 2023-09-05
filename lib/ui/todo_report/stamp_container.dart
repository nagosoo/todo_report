import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_report/asset/asset_color.dart';
import 'package:todo_report/providers/stamp_provider.dart';

class StampContainer extends StatelessWidget {
  const StampContainer({super.key});

  @override
  Widget build(BuildContext context) {
    StampProvider stampNotifier = StampProvider();
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
            return StampBottomSheetDialog(stampProvider: stampNotifier);
          },
        );
      },
      child: ListenableBuilder(
        listenable: stampNotifier,
        builder: (BuildContext context, Widget? child) {
          return stampNotifier.stamp.isNotEmpty
              ? SvgPicture.asset(
                  'assets/images/수락.svg',
                  width: 40,
                  height: 45,
                )
              : const SizedBox.shrink();
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
                80,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      stampProvider.chooseStamp(
                        'assets/images/수락.svg',
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/images/수락.svg',
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
