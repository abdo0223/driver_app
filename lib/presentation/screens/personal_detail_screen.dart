// ignore_for_file: deprecated_member_use

import 'package:driver/functions/personal_detail_fun.dart';
import 'package:driver/presentation/widgets/general_widgets/general_appbar_widget.dart';
import 'package:driver/presentation/widgets/personal_detail_widgets/pd_widget_title.dart';
import 'package:driver/providers/provider_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({Key? key}) : super(key: key);

  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {

  final PersonalDetailFun _personalDetailFun = PersonalDetailFun();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      _personalDetailFun.getUserDetails(ctx: context);});
  }

  @override
  Widget build(BuildContext context) {
    return GeneralAppBarWidget(
        title: 'Profile',
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 63,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                ),
              ),

              Text(Provider.of<ProviderUserDetails>(context, listen: true).name, style: const TextStyle(
                fontSize: 28, color: Colors.black)),
              PdWidgetTitle(title: 'Email', data: Provider.of<ProviderUserDetails>(context, listen: true)
                  .email,
                  iconData: Icons.email),
              PdWidgetTitle(title: 'Date of Birth', data: _personalDetailFun.
              getTimestamp(timestamp: Provider.of<ProviderUserDetails>
                    (context, listen: true).dateOfBirth),
                  iconData: Icons.date_range),
              PdWidgetTitle(title: 'Mobile', data: Provider.of<ProviderUserDetails>(context, listen: true)
                  .mobile,
                  iconData: Icons.mobile_friendly),
              PdWidgetTitle(title: 'National Id', data: Provider.of<ProviderUserDetails>
                (context, listen: true).nationalId,
                  iconData: Icons.credit_card),
              PdWidgetTitle(title: 'License Expiry Date', data: _personalDetailFun.
              getTimestamp(timestamp: Provider.of<ProviderUserDetails>
                (context, listen: true).dateOfBirth),
                  iconData: Icons.date_range),
              PdWidgetTitle(title: 'Zone Area', data: Provider.of<ProviderUserDetails>
                (context, listen: true).zoneArea,
                  iconData: Icons.location_on),
              FlatButton(onPressed: () async{
                await FirebaseAuth.instance.signOut();
              }, child: const Text('Logout', style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}


