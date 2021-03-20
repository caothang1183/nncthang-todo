import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double size;
  final double textSize;
  final Color indicatorColor;
  final String message;

  const CustomProgressIndicator({
    Key key,
    this.size = 14,
    this.textSize = Dimens.mediumFontSize,
    this.message = "",
    this.indicatorColor = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
          ),
          height: size,
          width: size,
        ),
        SizedBox(width: 10.0),
        Text(
          message,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
