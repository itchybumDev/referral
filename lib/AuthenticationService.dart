import 'file:///C:/Users/nlchu/AndroidStudioProjects/contact_tracer/contact_tracer/lib/pages/MyHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser globalUser;

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<bool> isUserLoggedIn() async {
  print("user is not log in ");
  globalUser = await _auth.currentUser();
  if (globalUser == null) {
    return false;
  }
  return true;
}

void signOutFirebase() async {
  print("Provider " + globalUser.providerId);

  await _auth.signOut();
  globalUser = null;
}

Future<bool> loginUser(String phone, BuildContext context,
    TextEditingController _codeController) async {

  _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        AuthResult result = await _auth.signInWithCredential(credential);

        FirebaseUser user = result.user;
        globalUser = user;

        if (user != null) {
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (AuthException exception) {
        print(exception.message);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Verification code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Confirm"),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential =
                          PhoneAuthProvider.getCredential(
                              verificationId: verificationId, smsCode: code);

                      AuthResult result =
                          await _auth.signInWithCredential(credential);

                      FirebaseUser user = result.user;
                      globalUser = user;

                      if (user != null) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage()), (route) => false);
                      } else {
                        print("Error");
                      }
                    },
                  )
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {});
}
