import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import './Firm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataController extends GetxController{



  Activity currentActivity  = Activity.empty().obs();
  Activity addActivityTemp = Activity.empty();
  List<Activity> doneActivList = List<Activity>.empty().obs();
  List<Activity> ownActivList = List<Activity>.empty().obs();
    void getUserTasks(String uid) async{
      var data = await FirebaseFirestore.instance.collection('users').doc(uid).collection('done').get();

      doneActivList = List<Activity>.empty().obs();
    data.docs.forEach((element) {

      doneActivList.add(Activity(element.id, element['duration'], element['difficulty'], element['refresh']));
    });
      data = await FirebaseFirestore.instance.collection('users').doc(uid).collection('own').get();

      ownActivList = List<Activity>.empty().obs();
      data.docs.forEach((element) {

        ownActivList.add(Activity(element.id, element['duration'], element['difficulty'], element['refresh']));
      });
      update();
    }
    void putUserTask(String uid, String path) async{
      FirebaseFirestore.instance.collection('users').doc(uid).collection(path).doc(addActivityTemp.name).set(
        addActivityTemp.toJson()
      );
    }
    void getRandom(String uid, String path, [bool community = false]) async {
      var data = (await FirebaseFirestore.instance.collection('users').doc(uid).collection(path).get()).docs;
      var choosen =  (data..shuffle()).first;

      currentActivity = Activity(choosen.id, choosen['duration'], choosen['difficulty'], choosen['refresh']);

      update();
    }

}
class Activity{
  Activity(this.name,  this.duration, this.difficulty, this.refresh);

  Activity.empty();
  String name = "".obs();
  int duration = 0.obs();
  int difficulty = 0.obs();
  int refresh = 0.obs();
  bool isNotEmpty(){
    if(name == "")return false;
    return true;
  }
  Map<String, dynamic> toJson(){
    return {
      "name" : name,
      "duration" : duration,
      "difficulty" : difficulty,
      "refresh" : refresh,
    };
  }
}