import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/DefaultPage.dart';
import '../controllers/DataController.dart';
import '../controllers/AuthController.dart';

class ActiveActivity extends StatelessWidget{
  const ActiveActivity({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    DataController data_c = Get.find();
    AuthController auth_c = Get.find();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24.0))

            ),

            child: Scaffold(
              body: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                          data_c.currentActivity.name + ":", style: Get.textTheme.headline1,
                      ),
                      Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.timer),
                              Text(
                                  " : ${data_c.currentActivity.duration}"
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.circle),
                              Text(
                                  " : ${data_c.currentActivity.difficulty}"
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),

                  Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text("Finish"),

                        onPressed: (){
                          data_c.currentActivity = Activity.empty();
                          data_c.putUserTask(auth_c.user!.uid, 'done');
                          Get.offAll(DefaultPage());
                        },
                      ),
                      VerticalDivider(color: Colors.white70, thickness: 1, width: 24.0,),
                      TextButton(
                        child: Text("Redraw"),

                        onPressed: (){
                          data_c.currentActivity = Activity.empty();
                          data_c.getRandom(auth_c.user!.uid, 'own', true);
                        },
                      ),
                      VerticalDivider(color: Colors.white70, thickness: 1, width: 24.0,),
                      TextButton(
                        child: Text("Abort"),
                        onPressed: (){

                          data_c.currentActivity = Activity.empty();
                          Get.offAll(DefaultPage());
                        },
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
