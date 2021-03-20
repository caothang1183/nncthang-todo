import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';

class LargeButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color labelColor;
  final String label;
  final double height;
  final Function onTap;

  const LargeButtonWidget({
    Key key,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
    this.label = "",
    this.height = 50.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [
              backgroundColor.withOpacity(1.0),
              backgroundColor.withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: labelColor,
              fontSize: Dimens.mediumFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
