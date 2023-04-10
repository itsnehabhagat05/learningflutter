import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';


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
    final catalogJson=await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    final productsData =  decodedData["products"];
  }



  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // String name = "codepur";
    final dummyList = List.generate(12, (index) => CatalogModel.items[0]);

    return Scaffold(  
      appBar: AppBar(
        title: Text("Catalog App",
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item : dummyList[index],
              
            );
          },
        ),
      ) ,
        // body:Center(
        //   child:Container(
        //     child: Text("Hello world - Welcome"), 
        //   ),    
        // ),
        drawer: MyDrawer(),
      );
  }
}