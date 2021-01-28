import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';
import 'package:flutter_provider_demo/business_logic/view_models/note_viewmodel.dart';
import 'package:flutter_provider_demo/services/apis/note_apis.dart';
import 'package:flutter_provider_demo/services/service_locator.dart';
import 'package:flutter_provider_demo/ui/widget/loading_widget.dart';
import 'package:flutter_provider_demo/ui/widget/note_widget.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage>
    with AutomaticKeepAliveClientMixin {
  NoteViewModel model = serviceLocator<NoteViewModel>();

  @override
  void initState() {
    model.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteViewModel>(
      create: (context) => model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "笔记本",
            style: WjStyle.appBarStyle,
          ),
          backgroundColor: WJColors.color_F5F6F7,
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer<NoteViewModel>(
          builder: (context, model, child) {
            if (model.noteEntity == null) {
              return LoadingWidget();
            }
            return Container(
              color: WJColors.color_F5F6F7,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NoteWidget(model.noteEntity.content[index]);
                },
                itemCount: model?.noteEntity?.content?.length,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
