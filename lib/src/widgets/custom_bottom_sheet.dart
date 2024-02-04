import 'package:allride_utilities/allride_utilities.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? positiveButtonLabel;
  final String? negativeButtonLabel;
  final Function positiveButtonPressed;
  final Function negativeButtonPressed;

  const CustomBottomSheet(
      {Key? key,
      required this.title,
      this.subTitle,
      this.positiveButtonLabel,
      this.negativeButtonLabel,
      required this.positiveButtonPressed,
      required this.negativeButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showCustomBottomSheetWithAction(
        context: context,
        title: title,
        subTitle: subTitle ?? '',
        positiveButtonLabel: positiveButtonLabel ?? '',
        negativeButtonLabel: negativeButtonLabel ?? '',
        positiveButtonPressed: positiveButtonPressed.call(),
        negativeButtonPressed: negativeButtonPressed.call());
  }
}

showCustomBottomSheetWithAction(
    {required BuildContext context,
    String? title,
    String? subTitle,
    String? positiveButtonLabel,
    String? negativeButtonLabel,
    required VoidCallback positiveButtonPressed,
    required VoidCallback negativeButtonPressed}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.cardCornerRadius),
            topRight: Radius.circular(Dimens.cardCornerRadius)),
      ),
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.kDefaultPadding * 1.7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppComponent.subHeadingText(
                    context: context, text: title ?? '', maxLines: 1),
                const SizedBox(
                  height: Dimens.kDefaultPadding,
                ),
                AppComponent.subTitleText(
                    context: context, text: subTitle ?? '', maxLines: 3),
                const SizedBox(
                  height: Dimens.kDefaultPadding * 2,
                ),
                Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                            onPressed: positiveButtonPressed,
                            label: positiveButtonLabel ?? 'Yes')),
                    const SizedBox(
                      width: Dimens.kDefaultPadding,
                    ),
                    Expanded(
                        child: OutlineButton(
                            onPressed: negativeButtonPressed,
                            label: negativeButtonLabel ?? 'No')),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
