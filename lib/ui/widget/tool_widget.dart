import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';
import 'package:flutter_provider_demo/business_logic/utils/widget_extention_util.dart';

class ToolWidget extends StatelessWidget {
  final Function function;
  final IconData iconData;
  final String title;
  final Color color;
  final Color textColor;
  final Color iconColor;

  const ToolWidget({
    Key key,
    this.function,
    this.iconData,
    this.title,
    this.color,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Icon(
            iconData,
            size: 60,
            color: iconColor,
          ),
          Spacer(),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ).gestureDetectorExtension(
          () => function(),
    );
  }
}
