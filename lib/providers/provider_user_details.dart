import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProviderUserDetails with ChangeNotifier{

  String _token = '';
  String _email = '';
  Timestamp _dateOfBirth = Timestamp(0, 0);
  String _mobile = '';
  String _nationalId = '';
  Timestamp _licenseExpire = Timestamp(0, 0);
  String _zoneArea = '';
  String _name = '';
  final List<String> _listTextEditingFields = ['', ''];


  String get token{
    return _token;
  }
  String get email{
    return _email;
  }
  Timestamp get dateOfBirth{
    return _dateOfBirth;
  }
  String get mobile{
    return _mobile;
  }
  String get nationalId{
    return _nationalId;
  }
  Timestamp get licenseExpire{
    return _licenseExpire;
  }
  String get zoneArea{
    return _zoneArea;
  }
  String get name{
    return _name;
  }
  List<String> get listTextEditingFields{
    return _listTextEditingFields;
  }

  void getUserDetails({required String? token, required String? email, required Timestamp? dateOfBirth,
    required String? mobile, required String? nationalId, required Timestamp? licenseExpire,
    required String? zoneArea, required String? name
  }){
    _token = token!;
    _email = email!;
    _dateOfBirth = dateOfBirth!;
    _mobile = mobile!;
    _nationalId = nationalId!;
    _licenseExpire = licenseExpire!;
    _zoneArea = zoneArea!;
    _name = name!;
    notifyListeners();
  }
  void changeControllers({required String controllerText, required int index}){
    _listTextEditingFields[index] = controllerText;
  }


}