
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracer/AuthenticationService.dart';
import 'package:contact_tracer/model/peopleIMet.dart';
import 'package:contact_tracer/model/UserCondition.dart';

class FirestoreService {
  static save(PeopleIMet peopleIMet) {
    print("saing to db");
    Firestore.instance
        .collection('users')
        .document(globalUser.uid)
        .collection('data')
        .add(peopleIMet.toJson());
  }

  static declareHealth(UserCondition entry) {
    Firestore.instance
        .collection('users')
        .document(globalUser.uid)
        .setData(entry.toJson());
  }

  static Future<List<DocumentSnapshot>> getEveryoneIMetToday() {
    return Firestore.instance
        .collection('users')
        .document(globalUser.uid)
        .collection('data')
        .orderBy('metTime', descending: true)
        .getDocuments()
        .then((value) => value.documents);
  }
}
