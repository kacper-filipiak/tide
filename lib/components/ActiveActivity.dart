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
    return  Scaffold(
      backgroundColor: Colors.black38,
    body:Center(
      child: SizedBox(
        width: Get.width*0.9,
        height: Get.height*0.9,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24.0))

                ),

                child: Column(

                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,

                       children: [
                         Column(
                           children: [
                             Text(
                                 data_c.currentActivity.name , style: Get.textTheme.headline1, softWrap: true,
                             ),

                             Text(data_c.currentActivity.category, style: Get.textTheme.bodyText2),
                           ],
                         ),

                         Column(
                           children: [
                             Divider(),
                             Row(
                               children: [
                                 Icon(Icons.timer),
                                 Text(
                                     " : ${data_c.currentActivity.duration} min"
                                 ),
                               ],
                             ),
                             Divider(),
                             Row(
                               children: [
                                 Icon(Icons.circle),
                                 Text(
                                     data_c.currentActivity.difficulty
                                 ),
                               ],
                             ),
                           ],
                         ),

                       ],
                     ),

                     Divider(),
                     Text(data_c.currentActivity.description, style: Get.textTheme.bodyText2, softWrap: true,),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextButton(
                           child: Text("Finish", style: Get.textTheme.button),

                           onPressed: ()async{
                             await data_c.putUserTask(auth_c.user!.uid, 'done', data_c.currentActivity.name);
                             data_c.currentActivity = Activity.empty();

                             //Get.offAll(DefaultPage());
                           },
                         ),
                         VerticalDivider(color: Colors.white70, thickness: 1, width: 24.0,),
                         TextButton(
                           child: Text("Redraw", style: Get.textTheme.button),

                           onPressed: (){
                             data_c.currentActivity = Activity.empty();
                             data_c.getRandom(auth_c.user!.uid, 'own', true);
                           },
                         ),
                         VerticalDivider(color: Colors.white70, thickness: 1, width: 24.0,),
                         TextButton(
                           child: Text("Abort", style: Get.textTheme.button,),
                           onPressed: (){

                             data_c.currentActivity = Activity.empty();
                             //Get.offAll(DefaultPage());
                             data_c.update();
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
    ),
    );
  }
}
