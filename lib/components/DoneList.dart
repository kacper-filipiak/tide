import 'package:flutter/material.dart';
import "../controllers/DataController.dart";
import 'package:get/get.dart';

class DoneList extends StatelessWidget{
  const DoneList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    DataController data_c = Get.find();
    return Scaffold(
      body:
    SizedBox(
      height: Get.height*0.4,
      child: GetBuilder<DataController>(
        builder: (data_c) => ListView.builder(itemCount: data_c.doneActivList.length,
        itemBuilder: (context, index){
          return ListTile(title: Text(data_c.doneActivList[index].name));
        }

        )
      ),
    )
    );
  }
}