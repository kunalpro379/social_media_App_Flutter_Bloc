import 'package:flutter/material.dart';
import 'package:connectiva/core/utils/imageconstants.dart';
import 'package:connectiva/core/utils/size_utils.dart';
import 'package:connectiva/theme/custom_text_style.dart';
import 'package:connectiva/widgets/custom_image_view.dart';

class CustomSearchView extends StatelessWidget {
  final Alignment? alignment;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final InputBorder? border;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  const CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputType,
    this.maxLines,
    this.hintText,
    this.prefix,
    this.hintStyle,
    this.contentPadding,
    this.border,
    this.fillColor,
    this.filled,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildSearchField(),
          )
        : _buildSearchField();
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        autofillHints: [AutofillHints.name],
        style:
            style ?? TextStyle(color: Colors.white), // Set text color to white
        keyboardType: textInputType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: hintStyle ?? CustomTextStyles.bodyMediumBluegray400,
          prefixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          //suffixIcon: suffixIcon(),
          contentPadding: contentPadding ?? EdgeInsets.all(16),
          fillColor: fillColor ?? Color.fromARGB(255, 159, 124, 255),
          filled: filled ?? true,
          border: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
          enabledBorder: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }

  Widget? suffixIcon() {
    if (prefix == null) {
      return Container(
        margin: EdgeInsets.fromLTRB(30, 11, 16, 11),
        child: CustomImageView(
          imagePath: ImageConstant.DefStoryImage,
          height: 18,
          width: 18,
        ),
      );
    }
    return null;
  }
}
