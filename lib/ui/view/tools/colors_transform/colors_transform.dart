import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';
import 'package:flutter_provider_demo/business_logic/view_models/tool/colors_transform_viewmodel.dart';
import 'package:flutter_provider_demo/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_demo/business_logic/utils/widget_extention_util.dart';

class ColorsTransform extends StatefulWidget {
  @override
  _ColorsTransformState createState() => _ColorsTransformState();
}

class _ColorsTransformState extends State<ColorsTransform> {
  ColorsTransformViewModel model = serviceLocator<ColorsTransformViewModel>();
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorsTransformViewModel>(
      create: (context) => model,
      child: Consumer<ColorsTransformViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              "RGB转换",
              style: WjStyle.appBarStyle,
            ),
            backgroundColor: WJColors.color_F5F6F7,
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: WJColors.color_B3B3B3,
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      controller: _controller,
                      showCursor: true,
                      cursorColor: WJColors.color_306BFF,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      decoration: InputDecoration(
                        hintText: "请输入颜色代码",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00FF0000),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: WJColors.color_B3B3B3,
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      controller: _controller,
                      showCursor: true,
                      cursorColor: WJColors.color_306BFF,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      decoration: InputDecoration(
                        hintText: "请输入颜色代码",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00FF0000),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: WJColors.color_B3B3B3,
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      controller: _controller,
                      showCursor: true,
                      cursorColor: WJColors.color_306BFF,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      decoration: InputDecoration(
                        hintText: "请输入颜色代码",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00FF0000),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
