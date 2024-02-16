import "package:firebase_auth/firebase_auth.dart";
//import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/sayfalar/giri%C5%9F_sayfasi.dart";
import "package:flutter_application_1/sayfalar/home_page.dart";

class Yuklenme_Sayfasi extends StatelessWidget {
  const Yuklenme_Sayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder/*<Object>*/(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          final girisyapildi = snapshot.hasData && snapshot.data != null;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: girisyapildi ? const Home_Page() : const GirisSayfasi(),
          );
        });
  }
}
