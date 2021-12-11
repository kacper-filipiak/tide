import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController{
        AuthController(){
        this.auth = FirebaseAuth.instance;
        this.user =  auth.currentUser.obs();
            auth
          .authStateChanges()
          .listen((User? _user) async {
            if (_user == null) {
              print('User is currently signed out!');
              idToken = "";
              user = null;
            } else {
              print('User is signed in!');
              idToken = await  _user.getIdToken();
              user = _user;
              
            }
          });
     
    }

    var login_error = false.obs();
    var error_message = "".obs();
    var email = "";
    var password = "";
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    
    String? idToken = "";
    void login() async {

       
        try {
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  update();
} on FirebaseAuthException catch (e) {
    login_error = true;
    update();
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
       
    }
    

 
}
