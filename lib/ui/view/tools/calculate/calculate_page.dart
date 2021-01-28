import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/business_logic/utils/style/white_jotter_style.dart';
import 'package:flutter_provider_demo/business_logic/view_models/tool/calculate_viewmodel.dart';
import 'package:flutter_provider_demo/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'choose_favorite_page.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();
  TextEditingController _controller;

  @override
  void initState() {
    model.loadData();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              "汇率计算",
              style: WjStyle.appBarStyle,
            ),
            backgroundColor: WJColors.color_F5F6F7,
            centerTitle: true,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseFavoritePage()),
                  );
                  model.refreshFavorites();
                },
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              baseCurrencyTitle(model),
              baseCurrencyTextField(model),
              quoteCurrencyList(model),
            ],
          ),
        ),
      ),
    );
  }

  Padding baseCurrencyTitle(CalculateScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 5),
      child: Text(
        '${model.baseCurrency.longName}',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Padding baseCurrencyTextField(CalculateScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          style: TextStyle(fontSize: 20),
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${model.baseCurrency.flag}',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            labelStyle: TextStyle(fontSize: 20),
            hintStyle: TextStyle(fontSize: 20),
            hintText: '兑换金额',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
          ),
          keyboardType: TextInputType.number,
          onChanged: (text) {
            model.calculateExchange(text);
          },
        ),
      ),
    );
  }

  Expanded quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.quoteCurrencies.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 60,
                child: Text(
                  '${model.quoteCurrencies[index].flag}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              title: Text(model.quoteCurrencies[index].longName),
              subtitle: Text(model.quoteCurrencies[index].amount),
              onTap: () {
                model.setNewBaseCurrency(index);
                _controller.clear();
              },
            ),
          );
        },
      ),
    );
  }
}
