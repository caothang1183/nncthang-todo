import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/presentation/widgets/custom_progress_indicator.dart';

class LargeRaiseButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color labelColor;
  final String label;
  final double height;
  final Function onTap;
  final bool loading;
  const LargeRaiseButtonWidget({
    Key key,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
    this.label = "",
    this.height = 50.0,
    this.onTap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onTap,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading ? CustomProgressIndicator(message: "", indicatorColor: AppColors.darkGrey) : SizedBox.shrink(),
              Text(
                label,
                style: TextStyle(
                  fontSize: Dimens.largeFontSize,
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          animationDuration: Duration(milliseconds: 300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
