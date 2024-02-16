// ignore_for_file: sort_child_properties_last, unused_import

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
//import 'package:cloud_firestore_web/cloud_firestore_web.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/par%C3%A7alar/anasayfa_%C3%BCr%C3%BCn_widget.dart';
import 'package:flutter_application_1/firebase_options.dart';
//import 'package:flutter_application_1/package.flutter/anasayfa_urun_widget2.dart';
import 'package:flutter_application_1/par%C3%A7alar/category_widget.dart';
import 'package:flutter_application_1/sayfalar/yuklenme_sayfasi.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // firstpage ekranda sürekli kalıyor ,silmek için 29 satırda kod var , istdiğin yere ekleyebilirsin...

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (error) {
    print(error);
  }

  // await Future.delayed(Duration(seconds: 2)); // firstpage bekletmek için

  FlutterNativeSplash.remove();
  /*
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
*/
  runApp(const Yuklenme_Sayfasi());
}
