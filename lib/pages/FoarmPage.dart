import 'package:flutter/material.dart';
import './AproveFormPage.dart';
import '../controllers/AuthController.dart';
import '../controllers/DataController.dart';
import 'package:get/get.dart';

class FoarmPage extends StatelessWidget {
    const FoarmPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        DataController data_c = Get.find();
        AuthController auth_c = Get.find();
        return Scaffold(
          body: Form(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Activity name",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.name = s,
                ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Activity difficulty",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.difficulty = int.parse(s),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Activity duration",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.duration = int.parse(s),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Activity refresh time",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.refresh = int.parse(s),
                  ),
                  Divider(),
                  ElevatedButton(
                    child: Text("Save activity"),
                    onPressed: ()=> Get.to(AproveFormPage()),

                  )
      ],
          ),
              ),
          ),
        );
    }
}
