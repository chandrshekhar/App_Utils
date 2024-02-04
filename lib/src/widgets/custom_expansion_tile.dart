import 'package:flutter/material.dart';

import '../../allride_utilities.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String desc;
  final int index;
  final List<dynamic> list;

  const CustomExpansionTile(
      {super.key, required this.title, required this.desc, required this.index, required this.list});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {

  List<bool> isExpanded = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimens.kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.cardCornerRadius),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: AppColors.black.withAlpha(20),
                spreadRadius: 3,
                blurRadius: 6),
          ]),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: AppComponent.titleText(context: context, text: widget.title),
          trailing: !isExpanded[widget.index]
              ? Container(
                  width: 21,
                  height: 21,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.black.withAlpha(100), width: 1)),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                    color: AppColors.black,
                  ),
                )
              : Container(
                  width: 21,
                  height: 21,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.black),
                  child: const Icon(
                    Icons.arrow_drop_up,
                    size: 18,
                    color: AppColors.white,
                  ),
                ),
          onExpansionChanged: (bool value) {
            setState(() {
              isExpanded[widget.index] = value;
            });
          },
          children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.kDefaultPadding,
                    horizontal: Dimens.kDefaultPadding * 2),
                color: AppColors.black.withAlpha(10),
                child: AppComponent.labelText(
                    context: context,
                    maxLines: 500,
                    fontWeight: FontWeight.w400,
                    text: widget.desc)),
          ],
        ),
      ),
    );
  }
}
