import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_now/services/eventModel.dart';

class DbService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  publishEvent({
    required String uid,
    required String eventName,
    required String eventDesc,
    required String eventType,
    required String eventMode,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
  }) async {
    await db
        .collection('users')
        .doc(uid)
        .collection('events')
        .doc(eventName)
        .set({
      "eventDesc": eventDesc,
      "eventType": eventType,
      "eventMode": eventMode,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime,
      "eventPublished": true,
    });

    return true;
  }

  dynamic getEvents(String uid) async {
    return await db
        .collection('users')
        .doc(uid)
        .collection('events')
        .get()
        .then((value) => value.docs);
  }

  Event? eventFromFirestoreEvent(snapshot) {
    return snapshot != null
        ? Event(
            eventName: snapshot.id,
            eventDesc: snapshot['eventDesc'],
            eventType: snapshot['eventType'],
            eventMode: snapshot['eventMode'],
            startDate: snapshot['startDate'],
            endDate: snapshot['endDate'],
            startTime: snapshot['startTime'],
            endTime: snapshot['endTime'],
            eventPublished: snapshot['eventPublished'],
          )
        : null;
  }
}
