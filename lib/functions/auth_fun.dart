import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/presentation/widgets/general_widgets/general_alert_dialog_widget.dart';
import 'package:driver/providers/provider_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class AuthFun{

  Future loginFun({required String email, required String password, required BuildContext ctx}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      /*
      await FirebaseFirestore.instance.collection('drivers').doc(_auth.user?.uid).get().then((value) {
        print(value.get('date_birth'));
        print(value.get('mobile'));
        print(value.get('national_id'));
        print(value.get('license_expir'));
        print(value.get('zone_area'));

        Provider.of<ProviderUserDetails>(ctx, listen: false).getUserDetails(
            token: _auth.user?.uid, email: _auth.user?.email, dateOfBirth: value.get('date_birth'),
            mobile: value.get('mobile'), nationalId: value.get('national_id'),
            licenseExpire: value.get('license_expir'), zoneArea: value.get('zone_area'));
      });

       */


    } on FirebaseAuthException catch(e){
      print(e.code);
      if(e.code == 'invalid-email'){
        return 'Invalid Email!';
      }
      else if(e.code == 'user-not-found'){
        return 'The email or password is incorrect';
      }
      else if(e.code == 'wrong-password'){
        return 'Wrong Password';
      }
    }
  }



}