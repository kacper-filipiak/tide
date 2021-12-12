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
              Divider(thickness: 4,),
              Text(
                "duration: ${data_c.addActivityTemp.duration}"
                ),
              Divider(thickness: 4,),
              Text(
                  "difficulty: ${data_c.addActivityTemp.difficulty}"
              ),
              Divider(thickness: 4,),
              Text(
                  "refresh: ${data_c.addActivityTemp.refresh}"
              ),
              Divider(thickness: 4,),
              Text(
                  "category: ${data_c.addActivityTemp.category}"
              ),
              Divider(thickness: 4,),
              Text(
                  "description: ${data_c.addActivityTemp.description}"
              ),
              Divider(thickness: 4,),

              Column(
                children: [
                  TextButton(
                    child: Text("Add to your activities",
                      style: Get.textTheme.button,
                    ),
                    onPressed: (){
                      data_c.putUserTask(auth_c.user!.uid, 'own', data_c.addActivityTemp.name);
                      Get.offAll(DefaultPage());
                    },
                  ),
                  TextButton(
                    child: Text("Add to done activities",

                      style: Get.textTheme.button,
                    ),
                    onPressed: (){

                      data_c.putUserTask(auth_c.user!.uid, 'done', data_c.addActivityTemp.name);
                      Get.offAll(DefaultPage());
                    },
                    ),
                  TextButton(
                    child: Text("Edit",
                      style: Get.textTheme.button,
                    ),
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