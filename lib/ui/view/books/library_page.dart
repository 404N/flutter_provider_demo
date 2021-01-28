import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图书馆",style: WjStyle.appBarStyle,),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: WJColors.color_F5F6F7,
        child: ListView.builder(
          itemBuilder: (context, index) {
            // return NoteWidget();
            return Container();
          },
          itemCount: 10,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
