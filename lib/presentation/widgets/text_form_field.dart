import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final bool isPassword;
  final int maxLines;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String term) onSubmitted;

  const TextFormFieldWidget({
    Key key,
    this.controller,
    this.focusNode,
    this.maxLines = 1,
    this.label = "",
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      validator:  (value) {
        if (value.isEmpty) {
          return 'Input much not be empty';
        }
        if (value.length < 4) {
          return 'Invalid length';
        }
        return null;
      },
      onFieldSubmitted: (value){
        FocusScope.of(context).unfocus();
        widget.onSubmitted(value);
      },
      cursorColor: AppColors.darkGrey,
      obscureText: widget.isPassword && isHidden,
      style: TextStyle(
        color: AppColors.darkGrey,
        fontSize: Dimens.mediumFontSize,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5, bottom: 5),
        labelText: widget.label,
        suffixIcon: widget.isPassword ? _toggleIconHidden() : null,
        labelStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: Dimens.mediumFontSize,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyNavigator),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyNavigator),
        ),
      ),
    );
  }

  Widget _toggleIconHidden() {
    return GestureDetector(
      onTap: (){
        setState(() {
          isHidden = !isHidden;
        });
      },
      child: Icon(
        isHidden ? Icons .visibility : Icons.visibility_off,
        color: AppColors.darkGrey,
        size: 16,
      ),
    );
  }
}
