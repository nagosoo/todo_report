import 'package:flutter/material.dart';

class StampContainer extends StatelessWidget {
  const StampContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      child: ElevatedButton(
        onPressed: (){
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return StampContainer();
            },
          );
        }, child: null,
      ),
    );
  }
}

class StampBottomSheetDialog extends StatelessWidget {
  const StampBottomSheetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

