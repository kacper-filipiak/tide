import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/DataController.dart';

class OwnList extends StatelessWidget{
  const OwnList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:
        GetBuilder<DataController>(
            builder: (data_c) => ListView.builder(
                shrinkWrap: true,
                itemCount: data_c.ownActivList.length,
                itemBuilder: (context, index){
                  return ListTile(title: Text(data_c.ownActivList[index].name));
                }

            )
        )
    );
  }
}