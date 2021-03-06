import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/DataController.dart';
import '../controllers/AuthController.dart';
import './DefaultPage.dart';
class DrawPage extends StatelessWidget{
  DrawPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    DataController data_c = Get.find();
    AuthController auth_c = Get.find();
    data_c.getRandom(auth_c.user!.uid, 'own');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
                "name: ${data_c.currentActivity.name}"
            ),
            Divider(),
            Text(
                "duration: ${data_c.currentActivity.duration}"
            ),
            Divider(),
            Text(
                "difficulty: ${data_c.currentActivity.difficulty}"
            ),
            Divider(),
            Text(
                "refresh: ${data_c.currentActivity.refresh}"
            ),
            Divider(),

            Row(
              children: [
                ElevatedButton(
                  child: Text("I'll do this"),
                  onPressed: (){
                    Get.back();
                  },
                ),
                ElevatedButton(
                  child: Text("Redraw activity"),
                  onPressed: (){

                    data_c.currentActivity = Activity.empty();
                    Get.offAll(DrawPage());
                  },
                ),
                ElevatedButton(
                  child: Text("Cancel activity"),
                  onPressed: () {
                    data_c.currentActivity = Activity.empty();
                    Get.offAll(DefaultPage());

                  },
                ),

              ],
            )
          ],
        ),
      ),
    );

  }
}