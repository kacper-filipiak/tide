import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/DataController.dart';
import '../controllers/AuthController.dart';

class ActiveActivity extends StatelessWidget{
  const ActiveActivity({Key? key}): super(key: key);

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
                  child: Text("Finish activity"),

                  onPressed: (){
                    data_c.currentActivity = Activity.empty();
                    data_c.putUserTask(auth_c.user!.uid, 'done');
                  },
                ),
                ElevatedButton(
                  child: Text("Abort acttivity"),
                  onPressed: (){

                    data_c.currentActivity = Activity.empty();
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