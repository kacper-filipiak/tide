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
        data_c.getUserTasks(auth_c.user!.uid);
        return Scaffold(
          key: _key,
                extendBody: true,
                backgroundColor: Colors.transparent,
                bottomNavigationBar: BottomDefaultPage(gkey: _key),
                drawer: DefaultPageDrawer(),
                body: Stack( children:[

                  SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: FittedBox(child: Image.asset('assets/wave_bg.png',),  fit: BoxFit.fitHeight)),
                  //  AnimatedBackgroundDefaultPage(),
                  //DefaultPageBody(),
                   GetBuilder<DataController>(builder: (data_c)=>
                   data_c.currentActivity.isNotEmptyActivity()? ActiveActivity(): DefaultPageBody()),
                ],
                ),
                );
    }
}

class BottomDefaultPage extends StatelessWidget {
  const BottomDefaultPage({
    Key? key,
    required GlobalKey<ScaffoldState> gkey,
  }) : _key = gkey, super(key: key);

  final GlobalKey<ScaffoldState> _key;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.menu),

                      onPressed:()=> _key.currentState!.openDrawer(),

                    ),
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
          SizedBox(
            height: 88,
            child: Stack(
              children: [
                Container(

                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(88) ),
                      color: Color.fromARGB(200, 123, 124, 124),
                    ),
                    child: SizedBox(width: 88, height: 88,)
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.add),

                      onPressed:()=> Get.to(FoarmPage()),

                    ),
                  ),
                )
              ],
            ),
          ),
        ]
    );
  }
}

class DefaultPageBody extends StatelessWidget {
    const DefaultPageBody({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        DataController data_c = Get.find();
        UIController ui_c = Get.find();
        AuthController auth_c = Get.find();
        return Center(child: Column(
                    children: [
                      Center(
                        child: Column( children: [
                          SizedBox(height: Get.height * 0.5-126.0),
                        Stack(
                          children: [ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 123, 124, 124)),
                                  shape: MaterialStateProperty.all(CircleBorder()),
                              ),
                            child: SizedBox(
                                width: 172,
                                height: 172,
                                child: Center(child: Text("Draw activity"))),
                            onPressed: ()async {

                              await data_c.getRandom(auth_c.user!.uid, 'own', true);
                              //Get.dialog(ActiveActivity());


                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(152.0,152.0,0.0,0.0),
                          child: Container(
                           decoration: BoxDecoration(
                             color: Color.fromARGB(123, 123, 123, 123),
                             border: Border.all(color: Colors.transparent),
                             borderRadius: BorderRadius.circular(48.0),
                           ),
                            child: IconButton(
                              icon: Icon(Icons.filter_alt, color: Color.fromARGB(239, 239, 239, 239)),

                              iconSize: 48.0,
                              onPressed: (){},
                            ),
                          ),
                        ),
          ],
        ),
                        ],),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [


                        GetBuilder<UIController>(
      builder: (ui_c)=> Column(
      children:[
                          SizedBox(height: Get.height*(0.25-ui_c.calmWidth),),
                           ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 123, 124, 124)),
                                shape: MaterialStateProperty.all(CircleBorder()),
                              ),
                            child: SizedBox(
                              width: Get.width*0.1+ui_c.countDown*3,
                              height: Get.height*0.1+ ui_c.countDown*3,
                              child: Center(child: Text(ui_c.calmText, textAlign: TextAlign.center,)),
                            ),
                            onPressed: (){
                              ui_c.toggleBreathing();
                            }

        ),
        ],),
                        ),


                      Divider(),

      ],),
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

                            Text("Your activities:"),
                            Expanded(child: OwnList()),
                          ],
                        ),

                        );
    }
}
