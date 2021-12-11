import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/DefaultPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import './Firm.dart';

class UIController extends GetxController{

    var countDown = 0.obs();
    String getLastSubmitionDate(Firm currentFirm){

        return currentFirm.reports.isNotEmpty  ?  DateFormat("dd-MM-yyyy").format(currentFirm.reports.first.date): "";
    }
    String getDaysToDeadline(){
        DateTime now = DateTime.now();
        var  next  = DateTime.utc(now.year, (now.month)%12 + 1, 1 );
        next = next.subtract(Duration(days: 1));
        return (next.day - now.day).toString();
    }

    DateTime historyDate = DateTime.now().obs();
    String getHistoryDate(DateTime date){
        return DateFormat("MM-yyyy").format(date);
    }
    double offset = 0.0.obs();
    void startWave() async{

            await Future.delayed(Duration(milliseconds: 10));
            offset += 0.01;
            
            update();
    }
    void startCountDown()async{
        countDown = 10;
        while(countDown > 0) {
            await Future.delayed(Duration(seconds: 1));
            countDown--;
            update();
            //TODO: Release on navigating off this screen
        }
        Get.back();

    }
}

