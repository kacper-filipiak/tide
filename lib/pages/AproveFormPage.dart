import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/AuthController.dart';
import '../controllers/DataController.dart';
import './DefaultPage.dart';

class AproveFormPage extends StatelessWidget{
  const AproveFormPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
      DataController data_c = Get.find();
      AuthController auth_c = Get.find();
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
               "name: ${data_c.addActivityTemp.name}"
              ),
              Divider(),
              Text(
                "duration: ${data_c.addActivityTemp.duration}"
                ),
              Divider(),
              Text(
                  "difficulty: ${data_c.addActivityTemp.difficulty}"
              ),
              Divider(),
              Text(
                  "refresh: ${data_c.addActivityTemp.refresh}"
              ),
              Divider(),

              Row(
                children: [
                  ElevatedButton(
                    child: Text("Add to your activities"),
                    onPressed: (){
                      data_c.putUserTask(auth_c.user!.uid, 'own');
                      Get.offAll(DefaultPage());
                    },
                  ),
                  ElevatedButton(
                    child: Text("Add to done activities"),
                    onPressed: (){

                      data_c.putUserTask(auth_c.user!.uid, 'done');
                      Get.offAll(DefaultPage());
                    },
                    ),
                  ElevatedButton(
                    child: Text("Edit"),
                    onPressed: ()=> Get.back(),
                  ),

                ],
              )
            ],
          ),
        ),
      );
  }
}