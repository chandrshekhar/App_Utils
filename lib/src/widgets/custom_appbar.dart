import 'package:easy_localization/easy_localization.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../allride_utilities.dart';

/*
  This is the AppBar for all the allride applications
  */

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? autoImplyLeading;
  final String? leadingIcon;
  final Widget? bottom;
  final bool hasTabBar;
  final double? elevation;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.actions,
    this.leadingIcon,
    this.autoImplyLeading = true,
    this.bottom,
    this.hasTabBar = false,
    this.elevation,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      //Column(
      // children: [
      //Expanded(
      //  child:
      Material(
        child: AppBar(
          automaticallyImplyLeading: autoImplyLeading!,
          actions: actions,
          elevation: elevation ?? 0,
          leading: autoImplyLeading == true
              ? IconButton(
            icon: SvgPicture.asset(
              leadingIcon ??
                  '${AppConstants.packagePath}${AppIcons.arrowBack}',
              color: AppColors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
              : const SizedBox(),
          title: Text(
            title!,
            textScaleFactor: 0.98,
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ).tr(),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTextTabBarHeight),
              child: bottom ?? const SizedBox()),
          // ),
          // ),
          //AppComponent.divider()
          // ],
        ),
      );
  }

  @override
  Size get preferredSize =>
      hasTabBar
          ? const Size.fromHeight(kToolbarHeight + kTextTabBarHeight)
          : const Size.fromHeight(kToolbarHeight);
}
