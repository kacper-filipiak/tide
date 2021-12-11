import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import './controllers/AuthController.dart';
import './controllers/DataController.dart';
import './controllers/UIController.dart';
import './pages/DefaultPage.dart';
import './pages/ErrorPage.dart';
import './pages/LoadingPage.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color whiteText = Color.fromARGB(255, 234, 234, 234);
    Color primaryColor = Color.fromRGBO(123, 124, 124, 1.0);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
              scaffoldBackgroundColor: Color.fromRGBO(123, 124, 124, 124),
        primaryColor: Color.fromRGBO(123, 123, 123, 1.0),
        drawerTheme: DrawerThemeData(backgroundColor: primaryColor ),
        fontFamily: 'Raleway',
        textTheme: TextTheme(

          headline1: TextStyle(fontSize: 72.0, color: whiteText, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, color: whiteText,fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0,color: whiteText, ),
          button: TextStyle(fontSize: 14.0,color: whiteText, ),
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        //Files with pages of the application
        // LoginPage.dart
        // ErrorPage.dart
        // LoadingPage.dart
        // DefaultPage.dart
        // HistoryPage.dart
        // AccountPage.dart
        // FoarmPage.dart
        // HistoryFoarmPage.
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
      UIController ui_c = Get.put(UIController());
      DataController data_c = Get.put(DataController());
      AuthController auth_c = Get.put(AuthController());
      auth_c.login();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorPage();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetBuilder<AuthController>(
                  builder: (auth_c) => auth_c.user == null ? LoadingPage() : DefaultPage());
        }
        // Once complete, show your application

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingPage();
      },
    );
  }
}
