import 'package:flutter/material.dart';

class StampContainer extends StatelessWidget {
  const StampContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
            return StampBottomSheetDialog();
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

class StampBottomSheetDialog extends StatelessWidget {
  const StampBottomSheetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.yellow,
    );
  }
}
