import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/providers/provider_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PersonalDetailFun{

  Future getUserDetails({required BuildContext ctx}) async{
    final _auth = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('drivers').doc(_auth?.uid).get().then((value) {
      Provider.of<ProviderUserDetails>(ctx, listen: false).getUserDetails(
          token: _auth?.uid, email: _auth?.email, dateOfBirth: value.get('date_birth'),
          mobile: value.get('mobile'), nationalId: value.get('national_id'), name:  value.get('name'),
          licenseExpire: value.get('license_expir'), zoneArea: value.get('zone_area'));
    });
  }

  String getTimestamp({required Timestamp timestamp}){
    String date = DateFormat('yyyy-MM-dd').format(DateTime.fromMicrosecondsSinceEpoch
      (timestamp.microsecondsSinceEpoch));
    return date;
  }



}