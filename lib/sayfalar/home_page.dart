//import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';
//import 'package:cloud_firestore_web/cloud_firestore_web.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/anasayfa_%C3%BCr%C3%BCn_widget.dart';
//import 'package:flutter_application_1/firebase_options.dart';
//import 'package:flutter_application_1/package.flutter/anasayfa_urun_widget2.dart';
import 'package:flutter_application_1/package.flutter/category_widget.dart';
import 'package:flutter_application_1/sayfalar/app_draver.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        actions: [
          IconButton(
            icon: Image.asset(
              'varliklar/zil.png',
              width: 27.5,
              height: 27.5,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 27,
              //width: 27.5,
              //height: 27.5,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              'varliklar/bag1.jpg',
              height: 32.5,
              width: 32.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
      /*******
         * ******
         * ******
         */

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText:
                      "Search Anything...", // search bar yazısı üst taraf kayıyor
                  prefixIcon: Image.asset(
                    'varliklar/search.png',
                    height: 25.5,
                    width: 25.5,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 50,
                    ),
                  ),
                ),
              ),
            ),
            //******************
            /********************
             */

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  )
                ],
              ),
            ),
            //SingleChildScrollView(
            const SizedBox(height: 16),
            // SingleChildScrollView(
            // ekran kaydırma varsayılan aşağı yukarı
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('categories')
                      //  .doc('beetechh')
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final categoryList =
                          snapshot.data!.docs.map((e) => e.data()).toList();
                      return Row(
                        children: [
                          for (final data in categoryList)
                            CategoryWidget(
                              title: data['name'],
                              imageUrl: data['imageUrl'],
                            ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            const SizedBox(height: 16),
            //**********************/
            //************
            //*************** */
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: const Color.fromARGB(255, 246, 210, 126),
                  child: Column(
                    children: [
                      const Text(
                        'MIN 15% OFF',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(250, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'SHOP NOW',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          background: Paint()
                            ..color = const Color.fromRGBO(159, 72, 14, 1),
                        ),
                      ),
                      //),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Colors.blue,
                  child: Image.asset(
                    'varliklar/1.photo.png',
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            //*************
            //*********************
            //*************** */ */ */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.1,
                // height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'varliklar/banner.png',
                      width: MediaQuery.of(context).size.width * 1,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //******************
            //*******************
            //****************** */ */ */

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Deal of the day',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 135, 10, 30),
              child: Container(
                width: 348,
                height: 436,
                padding: const EdgeInsets.all(20),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: 140,
                                height: 190,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              "varliklar/shoes1.png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 35,
                                      top: 148,
                                      child: Text(
                                        'Running Shoes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1F2937),
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 31,
                                      top: 171,
                                      child: Container(
                                        width: 78,
                                        height: 19,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFEF4444),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Upto 40% OFF',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 156,
                              top: 0,
                              child: SizedBox(
                                width: 140,
                                height: 190,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "varliklar/shoess.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 48,
                                      top: 148,
                                      child: Text(
                                        'Sneakers',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1F2937),
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 35.50,
                                      top: 171,
                                      child: Container(
                                        width: 69,
                                        height: 19,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFEF4444),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '40-60% OFF',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: 140,
                                height: 190,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "varliklar/clock.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 36,
                                      top: 148,
                                      child: Text(
                                        'Wrist Watches',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1F2937),
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 31,
                                      top: 171,
                                      child: Container(
                                        width: 78,
                                        height: 19,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFEF4444),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Upto 40% OFF',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 156,
                              top: 0,
                              child: SizedBox(
                                width: 140,
                                height: 190,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 140,
                                        height: 140,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "varliklar/voice.png"),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 24,
                                      top: 148,
                                      child: Text(
                                        'Bluetooth Speakers',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF1F2937),
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 35.50,
                                      top: 171,
                                      child: Container(
                                        width: 69,
                                        height: 19,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFEF4444),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '40-60% OFF',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0.15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /********/
            //************
            //*************** */ */

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Hot Sellling Footwear',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  )
                ],
              ),
            ),

            ///***********************
            ///***********************
            ///*********************** */ */ */

            const SizedBox(height: 16),
            // ekran kaydırma varsayılan aşağı yukarı
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: AnasayfaUrunWidget(
                      resimAdresi: "varliklar/shoes1.png",
                      baslik: "black snikears",
                      usdfiyat: 90,
                      IndirimOrani: 80,
                      iconAdresi: "varliklar/Rating Icon.png",
                      derece: 4.4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/shoes2.png",
                        baslik: "adidas snikears",
                        usdfiyat: 50,
                        IndirimOrani: 30,
                        iconAdresi: "varliklar/Rating Icon.png",
                        derece: 4.2),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/shoes3.jpeg",
                        baslik: "adidas snikears",
                        usdfiyat: 50,
                        IndirimOrani: 30,
                        iconAdresi: "varliklar/Rating Icon.png",
                        derece: 4.6),
                  ),
                ],
              ),
            ),
            //****************
            //*************** */ */
            //SingleChildScrollView(
            const SizedBox(height: 16),
            // SingleChildScrollView(
            // ekran kaydırma varsayılan aşağı yukarı
            /*
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        AnasayfaUrunWidget2(
                          resimAdresi: "varliklar/fashion.png",
                          baslik: "fashion",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AnasayfaUrunWidget2(
                          resimAdresi: "varliklar/Electronic.png",
                          baslik: "Electronic",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AnasayfaUrunWidget2(
                          resimAdresi: "varliklar/Application.png",
                          baslik: "Appliances",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AnasayfaUrunWidget2(
                          resimAdresi: "varliklar/Beauty.png",
                          baslik: "Beauty",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        AnasayfaUrunWidget2(
                          resimAdresi: "varliklar/funny.jpeg",
                          baslik: "Funny",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
*/
            //****************
            ////**************** */ */

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Hot Sellling Footwear',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      //  print('View All button was tapped.');
                      // Burada istediğiniz işlemi gerçekleştirebilirsiniz.
                    },
                    child: const Text(
                      'View All ->',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),
            // ekran kaydırma varsayılan aşağı yukarı
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/shirt.jpeg",
                        baslik: "Allen Solly Regular fit cotton shirt",
                        usdfiyat: 90,
                        IndirimOrani: 80,
                        iconAdresi: "varliklar/Rating Icon.png",
                        derece: 4.4),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/shirt2.jpeg",
                        baslik: "Calvin Clein Regular fit slim fit shirt",
                        usdfiyat: 50,
                        IndirimOrani: 30,
                        iconAdresi: "varliklar/Rating Icon.png",
                        derece: 4.6),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/shirt3.jpeg",
                        baslik: "Allen Solly Regular fit cotton shirt",
                        usdfiyat: 50,
                        IndirimOrani: 30,
                        iconAdresi: "varliklar/Rating Icon.png",
                        derece: 4.2),
                  ),
                ],
              ),
            ),

            /********/
          ],
        ),

        //drawer: const AppDrawer(),
      ),
      drawer: const AppDrawer(),
      /*******
         * 
         
         */

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 140,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'varliklar/home-2.png',
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      onPressed: () {
                        // Handle home button press
                      },
                    ),
                    const Text(
                      "Home",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'varliklar/element-3.png',
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                    const Text("Categories"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'varliklar/clock2.png',
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      onPressed: () {
                        // Handle orders button press
                      },
                    ),
                    const Text("Orders"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'varliklar/profile-circle.png',
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      onPressed: () {
                        // Handle profile button press
                      },
                    ),
                    const Text("Profile"),
                  ],
                ),
                // Add more IconButtons as needed
              ],
            ),
            const SizedBox(
              height: 15,
            ), // Adjust spacing between icons and the image
            Column(
              children: [
                Image.asset(
                  'varliklar/Rectangle.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
      /********
         * 
         * 
         * 
         */
    );
  }
}

//String selamlamaMetni = 'Merhaba Arkadaşlar ';
//int sayi = 5;
