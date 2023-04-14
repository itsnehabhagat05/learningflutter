
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    
    super.initState();
    loadData();
  }

  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson= await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    final productsData =  decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(() {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // String name = "codepur";
    // final dummyList = List.generate(12, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed:() =>Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty )
                CatalogList().expand()
              else
              CircularProgressIndicator().centered().py16().expand(),
            ]
        

           
              
      
          ),
        ),
      ),
      );
  }
}






 