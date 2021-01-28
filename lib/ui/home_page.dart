import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/business_logic/view_models/home_index_viewmodel.dart';
import 'package:flutter_provider_demo/services/service_locator.dart';
import 'package:flutter_provider_demo/ui/view/books/library_page.dart';
import 'package:flutter_provider_demo/ui/view/notes/note_page.dart';
import 'package:flutter_provider_demo/ui/view/personal/personal_page.dart';
import 'package:flutter_provider_demo/ui/view/tools/index_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '小工具'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.pencil), label: '笔记本'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book_solid), label: '图书馆'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '个人中心')
  ];

  List<Widget> tabBodies;
  PageController _pageController = PageController();
  HomeIndexViewModel model = serviceLocator<HomeIndexViewModel>();

  @override
  void initState() {
    super.initState();
    tabBodies = [
      IndexPage(),
      NotePage(),
      LibraryPage(),
      PersonalPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeIndexViewModel>(
      create: (context) => model,
      child: Consumer<HomeIndexViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: PageView.builder(
              //要点1
              physics: NeverScrollableScrollPhysics(),
              //禁止页面左右滑动切换
              controller: _pageController,
              //回调函数
              itemCount: 4,
              itemBuilder: (context, index) => tabBodies[index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: model.index,
              items: bottomTabs,
              onTap: (index) {
                _pageController.jumpToPage(index);
                model.switchIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
