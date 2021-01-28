import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/business_logic/utils/widget_extention_util.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';
import 'package:flutter_provider_demo/ui/view/tools/calculate/calculate_page.dart';
import 'package:flutter_provider_demo/ui/widget/tool_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "工具",
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          children: [
            ToolWidget(
              iconData: Icons.attach_money_sharp,
              title: "货币汇率",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatePage(),
                  ),
                );
              },
              color: WJColors.primaryLightValue,
              textColor: WJColors.white,
            ),
            ToolWidget(
              iconData: Icons.security_outlined,
              title: "密码管理",
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatePage(),
                  ),
                );
              },
              color: WJColors.primaryLightValue,
              textColor: WJColors.white,
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
