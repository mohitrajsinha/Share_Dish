import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_dish/models/catalogue.dart';

import '../utils/routes.dart';
import '../utils/widgets/home_widgets/catalogue_header.dart';
import '../utils/widgets/home_widgets/catalogue_list.dart';
import '../utils/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    var catalogueJson =
        await rootBundle.loadString("lib/assets/files/catalogue.json");
    var decodedData = jsonDecode(catalogueJson);
    var productsData = decodedData["products"];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.lightBluishColor,
          onPressed: () => Navigator.pushNamed(context, MyRoutes.Cartroute),
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
            child: Container(
          padding: Vx.m32,
          child: Column(children: [
            const CatalogueHeader(),
            if (CatalogueModel.items.isNotEmpty)
              const CatalogueList().py16().expand()
            else
              CircularProgressIndicator(
                color: context.accentColor,
              ).centered().py16().expand(),
          ]),
        )),
      ),
    );
  }
}
