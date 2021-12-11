import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/UIController.dart';
class CalmDown extends StatelessWidget{
  const CalmDown({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    UIController ui_c = Get.find();
    ui_c.startCountDown();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count down"),
            GetBuilder<UIController>(builder: (ui_c)=>Text(ui_c.countDown.toString())),
            ElevatedButton(onPressed: () => Get.back(), child: Text("I'm doing it"))
          ],
        ),
      ),
    );

  }
}