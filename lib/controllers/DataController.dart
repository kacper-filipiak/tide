import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import './Firm.dart';

class DataController extends GetxController{

    var nip = "";
    List<Firm> listOfFirms = [];
    Firm currentFirm = Firm.empty().obs();
    void bindFirm(User? _user){
        //TODO: implement binding firm by nip to user in api
        print("binding");
   }
    void getFirmsData(){
        //Mock for resta api call
        //TODO: implement api request for data
        listOfFirms.clear();
        listOfFirms.add(Firm.withReports("HANDEL OBWOŹNY ART.SPOŻ.I PRZEM. SIERADZKI JERZY","8992127037","POLSKA DOLNOŚLĄSKIE Wrocław Wrocław-Krzyki Wrocław Kościuszki 146 10 50-439 Wrocław", [Report(DateTime.now())]));
        
        listOfFirms.add(Firm("Firma druga", "8735459399803", "Tutaj",));
       //XDDDDD upad upad upad upad upad upad!!!! 
    }
    List<PopupMenuItem> getListOfFirmsNames(){
        List<PopupMenuItem> list = [];
        listOfFirms.asMap().forEach((i, v) {
           list.add(PopupMenuItem(
                           child: Text(v.name),
                           value: i,
           ));
        });
        return list;
    }
}
