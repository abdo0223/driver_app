
import 'package:driver/functions/personal_detail_fun.dart';
import 'package:driver/presentation/screens/login_screen.dart';
import 'package:driver/presentation/screens/personal_detail_screen.dart';
import 'package:driver/providers/provider_user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ProviderUserDetails()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0XFFFFAB4C)
      ),

      routes: {
        '/': (context) => StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapShot){
          if(snapShot.hasData) {
            return const PersonalDetailScreen();
          }
          else{
            return const LoginScreen();
          }
        }),

      },


    );
  }
}

