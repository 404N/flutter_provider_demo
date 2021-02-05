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
  TextEditingController _topRedController;
  TextEditingController _topGreenController;
  TextEditingController _topBlueController;
  TextEditingController _footRedController;
  TextEditingController _footGreenController;
  TextEditingController _footBlueController;

  @override
  void initState() {
    _topRedController=TextEditingController();
    _topGreenController=TextEditingController();
    _topBlueController=TextEditingController();
    _footRedController=TextEditingController();
    _footGreenController=TextEditingController();
    _footBlueController=TextEditingController();

    super.initState();
  }

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
                  height: 60,
                ),
                Center(
                  child: Text(
                    "十进制代码",
                    style: WjStyle.colorsTransformTopTextStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: Center(
                          child: TextField(
                            maxLines: 1,
                            controller: _topRedController,
                            showCursor: true,
                            cursorColor: WJColors.color_306BFF,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: Center(
                          child: TextField(
                            maxLines: 1,
                            controller: _topGreenController,
                            showCursor: true,
                            cursorColor: WJColors.color_306BFF,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: TextField(
                          maxLines: 1,
                          controller: _topBlueController,
                          showCursor: true,
                          textAlign: TextAlign.center,
                          cursorColor: WJColors.color_306BFF,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3)
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: (){
                    if(_topRedController.value.text.length>0){
                      _footRedController.text=model.getNumber(_topRedController.value.text, 0);
                    }
                    if(_topRedController.value.text.length==0&&_footRedController.value.text.length>0){
                      _topRedController.text=model.getNumber(_footRedController.value.text, 1);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: WJColors.color_306BFF,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        "转换",
                        style: WjStyle.colorsTransformTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: Center(
                          child: TextField(
                            maxLines: 1,
                            controller: _footRedController,
                            showCursor: true,
                            cursorColor: WJColors.color_306BFF,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: Center(
                          child: TextField(
                            maxLines: 1,
                            controller: _footGreenController,
                            showCursor: true,
                            cursorColor: WJColors.color_306BFF,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3)
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: WJColors.color_FFC552,
                        ),
                        child: TextField(
                          maxLines: 1,
                          controller: _footBlueController,
                          showCursor: true,
                          textAlign: TextAlign.center,
                          cursorColor: WJColors.color_306BFF,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3)
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "十六进制代码",
                    style: WjStyle.colorsTransformTopTextStyle,
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
