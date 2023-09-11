import 'package:flutter/material.dart';
import 'package:todo_report/providers/short_rating_provider.dart';

import '../../asset/asset_color.dart';
import '../../asset/asset_font.dart';

class RatingTextField extends StatelessWidget {
  const RatingTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    ShortRatingProvider shortRatingProvider = ShortRatingProvider();
    textEditingController.addListener(() {
      shortRatingProvider.editTodoReport(
        shortRatingProvider.shortRating.copyWith(
          rating: textEditingController.text,
        ),
      );
    });
    return ListenableBuilder(

        listenable: shortRatingProvider,
        builder: (BuildContext context, Widget? child) {
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
                      '${shortRatingProvider.shortRating.rating!}',
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
                child: SizedBox(
                  height: 140,
                  child: Center(
                    child:  TextField(
                      controller: textEditingController..addListener(() {
                        String newRating = shortRatingProvider.shortRating.rating!;
                        if (textEditingController.text != newRating) {
                          textEditingController.value = textEditingController.value.copyWith(
                            text: shortRatingProvider.shortRating.rating!,
                          );

                        }
                      }),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(5),
                      ),
                      textAlign: TextAlign.center,
                      style: AssetFont.mapoAgape400.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
