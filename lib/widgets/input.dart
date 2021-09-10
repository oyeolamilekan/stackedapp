import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stackedapp/config/size_config.dart';
import 'package:stackedapp/config/stacked_app.dart';
import 'package:stackedapp/extentions/num.dart';

class STACKEDTextFormField extends StatefulWidget {
  /*
   * This is an abstractions of flutter textfiled but with 
   * an added advantage with the default style from design
   * 
   * 
   */
  final TextEditingController? textEditingController;
  final String? title;
  final String? labelText;
  final String? formPrefixIcon;
  final String? formSuffixIcon;
  final Function? onChange;
  final Function? callBackOnFocus;
  final Function? callBackOffFocus;
  final TextInputType? textInputType;
  final String? formIcon;
  final Function? validator;
  final Function? prefixOnClick;
  final Function? suffixIconOnClick;
  final bool obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function? onEditingComplete;
  final Function? onSaved;
  final FontWeight titleFontWeight;
  final Color? titleColor;
  final int maxLines;
  final int? minLines;
  final Color fillColor;
  final bool removeBorder;
  final double radius;
  final bool enabled;
  final Color? prefixIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool textCapitalization;
  const STACKEDTextFormField({
    Key? key,
    this.textEditingController,
    this.title,
    this.labelText,
    this.textInputType,
    this.formIcon,
    this.onChange,
    this.validator,
    this.obscureText = false,
    this.callBackOnFocus,
    this.callBackOffFocus,
    this.maxLength,
    this.formPrefixIcon,
    this.prefixOnClick,
    this.textInputAction,
    this.onEditingComplete,
    this.maxLines = 1,
    this.onSaved,
    this.titleFontWeight = FontWeight.w400,
    this.titleColor,
    this.fillColor = Colors.white,
    this.removeBorder = false,
    this.radius = 8.0,
    this.enabled = true,
    this.inputFormatters,
    this.minLines,
    this.prefixIconColor,
    this.formSuffixIcon,
    this.suffixIconOnClick,
    this.textCapitalization = true,
  }) : super(key: key);

  @override
  _STACKEDTextFormFieldState createState() => _STACKEDTextFormFieldState();
}

class _STACKEDTextFormFieldState extends State<STACKEDTextFormField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(
      () {
        if (widget.callBackOnFocus != null) {
          if (_focusNode.hasFocus) {
            widget.callBackOnFocus!();
          } else {
            widget.callBackOffFocus!();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      widget.title!,
                      style: TextStyle(
                        fontWeight: widget.titleFontWeight,
                        color: widget.titleColor,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          TextFormField(
            key: ValueKey("textinput"),
            cursorColor: StackedApp.hexToColor("#494FB1"),
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            enabled: widget.enabled,
            inputFormatters: widget.inputFormatters,
            minLines: widget.minLines,
            textCapitalization: widget.textCapitalization
                ? TextCapitalization.words
                : TextCapitalization.none,
            decoration: new InputDecoration(
              hintText: widget.labelText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
              ),
              fillColor: widget.fillColor,
              filled: true,
              errorMaxLines: 3,
              suffixIcon: widget.formSuffixIcon != null
                  ? InkWell(
                      onTap: widget.suffixIconOnClick as void Function()?,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          widget.formSuffixIcon!,
                          width: 10,
                          height: 10,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    )
                  : null,
              prefixIcon: widget.formPrefixIcon != null
                  ? InkWell(
                      onTap: widget.prefixOnClick as void Function()?,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          widget.formPrefixIcon!,
                          width: 10,
                          height: 10,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    )
                  : null,
              contentPadding: new EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              focusedBorder: widget.removeBorder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(widget.radius),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: StackedApp.hexToColor("#494FB1"),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.radius),
                      ),
                    ),
              enabledBorder: widget.removeBorder
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(widget.radius),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: StackedApp.hexToColor("#E0E0E0"),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.radius),
                      ),
                    ),
            ),
            validator: (val) => widget.validator!(val) as String?,
            controller: widget.textEditingController,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            textInputAction: widget.textInputAction,
            onSaved: (String? value) => widget.onSaved!(value),
            onChanged: widget.onChange as void Function(String)?,
            onEditingComplete: widget.onEditingComplete as void Function()?,
            maxLines: widget.maxLines,
          ),
        ],
      ),
    );
  }
}
