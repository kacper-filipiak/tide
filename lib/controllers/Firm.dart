import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import './DataController.dart';


class GetWrapper<T, C>{

    GetWrapper(this.value, this.controller);
    C controller;
    T value;
}
class Firm {
    //TODO: fix to make it observable
    Firm(this.name, this.nip, this.adress);
    Firm.withReports(this.name, this.nip, this.adress, this.reports);
    Firm.empty();
    String name = "".obs();
    String nip = "".obs();
    String adress = "".obs();
    List<Report> reports = [];
    void assign(GetWrapper<Firm, DataController> firm){
        name = firm.value.name;
        nip = firm.value.nip;
        adress = firm.value.adress;
        reports = firm.value.reports;
        firm.controller.update();
    }
}
class Report{
    Report(this.date);
    DateTime date;
    bool operator<(Report r2){
        return date.isBefore(r2.date);
    }
    bool operator>(Report r2){
        return date.isAfter(r2.date);
    }
}
