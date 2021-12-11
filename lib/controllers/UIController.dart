import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/DefaultPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import './Firm.dart';

class UIController extends GetxController{

    var countDown = 0.obs();

    bool calmBool = false;
    String calmText = "Calm down".obs();
    double calmWidth = 0.01.obs();
    void toggleBreathing()async{
        countDown = 10;
        calmBool = !calmBool;
        calmWidth = 0.25;
        update();
        while(countDown > 0 && calmBool) {
            await Future.delayed(Duration(seconds: 3));
            countDown--;

            calmText = countDown%2 == 0? "Breath in": "Breath out";
            update();
            //TODO: Release on navigating off this screen
        }
        calmWidth = 0.1;
        calmText = "Calm down";
        countDown = 0;
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

