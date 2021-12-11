import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './FoarmPage.dart';
import '../controllers/AuthController.dart';
import '../controllers/DataController.dart';
import '../controllers/UIController.dart';
import './AnimatedBackgroundDefaultPage.dart';
import "./DrawPage.dart";
import './CalmDown.dart';
import '../components/OwnList.dart';
import '../components/DoneList.dart';
import '../components/ActiveActivity.dart';

class DefaultPage extends StatelessWidget {
    const DefaultPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      final GlobalKey<ScaffoldState> _key = GlobalKey();
        AuthController auth_c = Get.find();
        DataController data_c = Get.find();
        UIController ui_c = Get.find();
        ui_c.startWave();
        data_c.getUserTasks(auth_c.user!.uid);
        return Scaffold(
          key: _key,
                extendBody: true,
                backgroundColor: Colors.transparent,
                bottomNavigationBar: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 88,
                        child: Stack(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(88) ),
                                color: Color.fromARGB(200, 123, 124, 124),
                              ),
                              child: SizedBox(width: 88, height: 88,)
                            ),
                            Center(
                              child: IconButton(
                                icon: Icon(Icons.menu),

                                onPressed:()=> _key.currentState!.openDrawer(),

                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 44,

                        ),
                      ),
                    ]
                ),
                drawer: DefaultPageDrawer(),
                body: Stack( children:[

                  SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: FittedBox(child: Image.asset('assets/wave_bg.png',),  fit: BoxFit.fitHeight)),
                  //  AnimatedBackgroundDefaultPage(),
                   GetBuilder<DataController>(builder: (data_c)=>
                   data_c.currentActivity.isNotEmpty()? ActiveActivity(): DefaultPageBody()),
                ],
                ),
                );
    }
}

class DefaultPageBody extends StatelessWidget {
    const DefaultPageBody({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        DataController data_c = Get.find();
        UIController ui_c = Get.find();
        return Center(child: Column(
                    children: [
                        SizedBox(height: Get.height * 0.02),
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 123, 124, 124)),
                                shape: MaterialStateProperty.all(CircleBorder()),
                            ),
                          child: SizedBox(
                              width: 128,
                              height: 128,
                              child: Center(child: Text("Draw activity"))),
                          onPressed: ()=> Get.to(DrawPage()),
                        ),
                      ),
                      ElevatedButton(
                        child: Text("Calm down"),
                        onPressed: ()=> Get.to(CalmDown()),
                      ),


                      Divider(),
                    ],
                  ));
    }
}
class DefaultPageDrawer extends StatelessWidget{
    const DefaultPageDrawer({Key? key}) : super(key: key); 
    @override
    build(BuildContext context){
        DataController data_c = Get.find();
        return Drawer(
                        child: Column(
                          children: [
                            SizedBox(height: Get.height*0.1),
                            Text("Done activities:"),
                            Expanded(child: DoneList()),
                            Divider(),
                            ElevatedButton(
                              style: Get.theme.elevatedButtonTheme.style,
                              child: SizedBox(
                                width: Get.width * 0.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text("Add activity"),
                                    Icon(Icons.add_outlined, color: Colors.greenAccent),
                                  ],
                                ),
                              ),
                              onPressed: ()=> Get.to(FoarmPage()),
                            ),
                            Text("Your activities:"),
                            Expanded(child: OwnList()),
                          ],
                        ),

                        );
    }
}
