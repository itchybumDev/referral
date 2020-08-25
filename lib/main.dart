import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracer/AuthenticationService.dart';
import 'package:contact_tracer/FirestoreService.dart';
import 'file:///C:/Users/nlchu/AndroidStudioProjects/contact_tracer/contact_tracer/lib/pages/MyHomePage.dart';
import 'package:contact_tracer/model/peopleIMet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Firestore firestore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: FirebaseOptions(
      googleAppID: (Platform.isIOS || Platform.isMacOS) ? "1:204800649942:ios:77802605fcc13572a0b777" : "1:204800649942:android:dd96be4c94f32849a0b77",
      gcmSenderID: "1:204800649942:android:dd96be4c94f32849a0b77",
      apiKey: "AIzaSyBUNQk1qnuTq90C463QnMu6a2RQf0ahOsI",
      projectID: "tracer-b1f46",
    ),
  );

  firestore = Firestore(app: app);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Tracer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "Hello",),
    );
  }
}
