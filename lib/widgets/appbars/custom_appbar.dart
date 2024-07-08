import 'package:connectiva/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

enum Style { bgcolor, bgStyle }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(key: key);

  final double? height;
  final Style? styleType;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 7.v,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 0, 128),
              Color.fromARGB(255, 251, 21, 136),
              Color.fromARGB(255, 253, 50, 151),
              Color.fromARGB(255, 252, 89, 170),
              Color.fromARGB(255, 255, 123, 189),
              Color.fromARGB(255, 255, 144, 197),
              Color.fromARGB(255, 255, 158, 206),
              Color.fromARGB(255, 255, 203, 228),
              Color.fromARGB(255, 254, 223, 238),
              Color.fromARGB(255, 255, 232, 243),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(SizeUtils.width, height ?? 50.v);
  _getStyle() {
    switch (styleType) {
      case Style.bgStyle:
        return Container(
          height: 44.v,
          width: double.maxFinite,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.h)),
        );
      default:
        return null;
    }
  }
}
