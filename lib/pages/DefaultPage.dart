import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import './AccountPage.dart';
import './HistoryPage.dart';
import './FoarmPage.dart';
import '../controllers/AuthController.dart';
import '../controllers/DataController.dart';
import '../controllers/UIController.dart';
import '../controllers/Firm.dart';
import './AnimatedBackgroundDefaultPage.dart';
import "./DrawPage.dart";
import './CalmDown.dart';
import '../components/DoneList.dart';

class DefaultPage extends StatelessWidget {
    const DefaultPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        AuthController auth_c = Get.find();
        DataController data_c = Get.find();
        UIController ui_c = Get.find();
        ui_c.startWave();
        data_c.getFirmsData();
        return Scaffold(
                appBar: AppBar(title: GetBuilder<DataController>(builder: (data_c)=>/* Obx(() => GetBuilder<Controller>(builder: (c) =>*/
                Text(data_c.currentFirm.name)/*,),)*/,), shadowColor: Colors.transparent,),
                drawer: const DefaultPageDrawer(),
                body: Stack( children:[
                    AnimatedBackgroundDefaultPage(),
                   const DefaultPageBody(),
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
                      ElevatedButton(
                        child: Text("Draw activity"),
                        onPressed: ()=> Get.to(DrawPage()),
                      ),
                      ElevatedButton(
                        child: Text("Calm down"),
                        onPressed: ()=> Get.to(CalmDown()),
                      ),

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
                      DoneList(),

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
                        child: ListView(
                                children: [
                                    ListTile(
                                            leading: Icon(Icons.account_box_outlined),
                                            title: Text("Twoje dane"),
                                            onTap: ()=> Get.to(AccountPage()),
                                            ),
                                    ListTile(
                                            leading: Icon(Icons.history_outlined),
                                            title: Text("Historia"),
                                            onTap: ()=> Get.dialog(HistoryPage()),
                                            ),
                                    
                                            PopupMenuButton(onSelected: (v) =>
                                                    data_c.currentFirm.assign(GetWrapper<Firm, DataController>( 
                                                    data_c.listOfFirms[int.parse(v.toString())], data_c)),
                                                    itemBuilder: (context)=> data_c.getListOfFirmsNames(),
                                                    child: ListTile(
                                            leading: Icon(Icons.switch_account_outlined),
                                            title: Text("Zmień swoją firmę"),
                                            ),
                                            ),
                                ],
                        )
                        );
    }
}
