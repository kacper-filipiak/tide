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

      doneActivList.add(Activity(element.id, element['duration'], element['difficulty'], element['refresh'], element['category'], element['description']));
    });
      data = await FirebaseFirestore.instance.collection('users').doc(uid).collection('own').get();

      ownActivList = List<Activity>.empty().obs();
      data.docs.forEach((element) {

        ownActivList.add(Activity(element.id, element['duration'], element['difficulty'], element['refresh'], element['category'], element['description']));
      });
      update();
    }
    Future<void> putUserTask(String uid , String path, String name) async{


      name = name.replaceAll(" ", "_");
      FirebaseFirestore.instance.collection('users').doc(uid).collection(path).doc(name).set(
        addActivityTemp.toJson()
      );
      update();
    }
    Future<void> getRandom(String uid, String path, [bool community = true]) async {
      if(community == true){
        var data = (await FirebaseFirestore.instance.collection('comunity').get()).docs;
        var choosen = (data..shuffle()).first;

        print(choosen.id);
        currentActivity = Activity(
            choosen.id, choosen['duration'], choosen['difficulty'],
            choosen['refresh'], choosen['category'], choosen['description']);

      }else {
        var data = (await FirebaseFirestore.instance.collection('users').doc(
            uid).collection(path).get()).docs;
        var choosen = (data..shuffle()).first;

        currentActivity = Activity(
            choosen.id, choosen['duration'], choosen['difficulty'],
            choosen['refresh'], choosen['category'], choosen['description']);
      }
      update();
    }

}
class Activity{
  Activity(this.name,  this.duration, this.difficulty, this.refresh, this.category, this.description);

  Activity.empty();
  String name = "".obs();
  int duration = 0.obs();
  String difficulty = "".obs();
  int refresh = 0.obs();
  String description = "".obs();
  String category = "".obs();
  bool isNotEmptyActivity(){
    if(name == "")return false;
    return true;
  }
  Map<String, dynamic> toJson(){
    return {
      "name" : name,
      "duration" : duration,
      "difficulty" : difficulty,
      "refresh" : refresh,
      "description": description,
      "category": category,
    };
  }
}