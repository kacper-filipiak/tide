import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DrawPage extends StatelessWidget{
  DrawPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Do it"),
              ElevatedButton(onPressed: () => Get.back(), child: Text("I'm doing it"))
            ],
          ),
      ),
    );

  }
}