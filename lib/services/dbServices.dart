import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_now/services/authServices.dart';

class DbService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  createEvent(String uid, String eventName) {
    db.collection('users').doc(uid).set({
      "event_name": eventName,
      "time_created": DateTime.timestamp(),
    });
    logger.t("Created Succesfully");
  }
}
