import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../controllers/DataController.dart';
import '../controllers/UIController.dart';
import './HistoryFoarmPage.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HistoryPage extends StatelessWidget {
    const HistoryPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        DataController data_c = Get.find();
        UIController ui_c = Get.find();
        return Dialog(
                
                shape: Get.theme.dialogTheme.shape,
                child: Scaffold(
                        appBar: AppBar(
                                leading: IconButton(icon:Icon(Icons.cancel_outlined),
                                        onPressed: ()=> Get.back(),),
                                
                                title: Row(
                                              mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                            IconButton(icon: Icon(Icons.arrow_back_outlined),
                                                            onPressed: (){
                                                                var jiffyDate = Jiffy(ui_c.historyDate);
                                                                ui_c.historyDate = jiffyDate.subtract(months: 1).dateTime;
                                                                ui_c.update();
                                                            }),

                                          TextButton(
                                                  child: GetBuilder<UIController>(builder:
                                                          (ui_c)=>Text(ui_c.getHistoryDate(ui_c.historyDate),
                                                                  style: Get.theme.textTheme.headline3),),
                                          onPressed: () => Get.defaultDialog(
                                                  content:  SizedBox(
                                                                            width: Get.width * 0.5,
                                                                            height: Get.height * 0.5,
                                                                      child: SfDateRangePicker(
                                                                              showNavigationArrow: true,
                                                                              allowViewNavigation: false,
                                                                              maxDate: DateTime.now(),
                                                                              showActionButtons: true,
      view: DateRangePickerView.year,
      onSubmit: (date ){
          print(date.toString());
          ui_c.historyDate = date as DateTime;
          ui_c.update();
          Get.back();

      },
      onCancel: ()=>Get.back(),
      ),
                                                                    ),
                                                                  )),

                                            IconButton(icon: Icon(Icons.arrow_forward_outlined),
                                                            onPressed: (){
                                                                var jiffyDate = Jiffy(ui_c.historyDate);
                                                                jiffyDate= jiffyDate.add(months: 1);
                                                                //if(jiffyDate.isAfter(c.historyDate)) return;
                                                                ui_c.historyDate = jiffyDate.dateTime;
                                                                ui_c.update();}),
                                        ],
                                      ),
                                      ),
                  body: SizedBox(width: Get.width * 0.9, height: Get.height * 0.9, 
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                                                            GetBuilder<UIController>(builder: (ui_c) =>
                                                                                    HistoryFoarm(ui_c.historyDate),),
                                  ],
                          ),
                          ),
                )
                );
    }
}
