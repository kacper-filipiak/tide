import 'package:flutter/material.dart';

class HistoryFoarm extends StatelessWidget {
    HistoryFoarm(this.date,{Key? key,}) : super(key: key);

    DateTime date;
    @override
    Widget build(BuildContext context){
        return Text("HistoryFoarm"+date.toString());
    }
}
