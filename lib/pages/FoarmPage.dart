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
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,
                      hintText: "Activity name",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.name = s,
                ),
                  Divider(),
                  TextFormField(
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,
                      hintText: "Activity difficulty",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.difficulty = s,
                  ),
                  Divider(),
                  TextFormField(
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,
                      hintText: "Activity duration",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.duration = int.parse(s),
                  ),
                  Divider(),
                  TextFormField(
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,
                      hintText: "Activity refresh time",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.refresh = int.parse(s),
                  ),
                  Divider(),
                  TextFormField(
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,
                      hintText: "Activity category",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.category = s,
                  ),
                  Divider(),
                  TextFormField(
                    style: Get.textTheme.bodyText2,
                    decoration: InputDecoration(
                      hintStyle: Get.textTheme.bodyText2,

                      hintText: "Activity description",
                    ),
                    onChanged: (s)=> data_c.addActivityTemp.description = s,
                  ),
                  Divider(),
                  TextButton(
                    child: Text("Save activity",style: Get.textTheme.button, ),
                    onPressed: ()=> Get.to(AproveFormPage()),

                  )

      ],
          ),
              ),
          ),
        );
    }
}
