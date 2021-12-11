import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/DataController.dart';
import '../controllers/AuthController.dart';

class FirmManagePage extends StatelessWidget {
    const FirmManagePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        DataController data_c = Get.find();
        AuthController auth_c = Get.find();
        return Scaffold(
          body: Stack(
            children: [ 
            Center(
              child: Icon(Icons.sailing_sharp, size:  Get.height * 0.8, color: Colors.black12),
                    ),
            
            Center(
              child: SizedBox(
                      width: Get.width * 0.4,
                      height: Get.height * 0.4,
                child: Container(
                        color: Colors.white60,
                  child: Form(
                    child: Center( 
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Text("Login Page"),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                                onChanged: (s) => data_c.nip = s,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Nip',
  ),
                                        ),
                                      ),
                GetBuilder<DataController>(
                                              builder: (data_c) => 

                                      TextButton(
                                              child: Text("Dodaj firme"),
                                              onPressed: () => data_c.bindFirm(auth_c.user)),),
                                      ],
                              ),
                            )
                    ),
                  ),
                ),
              ),
            ),
                    ]
          ),
        );
 
    }
}
