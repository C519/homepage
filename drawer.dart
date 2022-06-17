import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:posttest6_1915016121_rhennanurlisa/controller/text_ctrl.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // variable untuk menampung data yang login
    // User? userAuth = FirebaseAuth.instance.currentUser;
    // variable yang menyimpan data di controller
    // final TextController control = Get.put(TextController());
    // membuat folder di firestore
    // CollectionReference user = FirebaseFirestore.instance.collection('users');
    return Drawer(
      backgroundColor: Color(0xff1f4690),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              "MENU KALENDER",
              style: TextStyle(
                  fontFamily: "poppins", fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dasboard',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Calendar()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Agenda',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => form()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.other_houses_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Lainnya',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return SecondPage();
                })));
              }),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Profil',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
          ),
          //     onTap: () async {
          //       // final data yaitu variable untuk menampung data, yang di bandingkan
          //       // antara data yang di firestore dengan di login
          //       final data = await user
          //           .where("email", isEqualTo: "${userAuth?.email}")
          //           .get();
          //       data.docs.forEach((element) {
          //         // untuk mnyimpan data di controller
          //         // control.id.value = element.id;
          //         control.namadepan.value = element.get("nama");
          //         control.email.value = element.get("email");
          //         control.namabelakang.value = element.get("alamat");
          //         control.password.value = element.get("password");
          //       });
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => Profil()));
          //     }),
          // SizedBox(
          //   height: 30,
          // ),
          // Divider(
          //   color: Colors.white,
          // ),
          // ListTile(
          //     title: Container(
          //       child: Row(
          //         children: [
          //           Icon(
          //             Icons.arrow_circle_up,
          //             color: Colors.white,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             'Log Out',
          //             style: TextStyle(color: Colors.white),
          //           )
          //         ],
          //       ),
          //     ),
          //     onTap: () {
          //       // untuk logout
          //       FirebaseAuth.instance.signOut();
          //       Navigator.push(context, MaterialPageRoute(builder: ((context) {
          //         return LoginPage();
          //       })));
          //     }),
          // SizedBox(height: 30),
        ],
      ),
    );
  }
}
