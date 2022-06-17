import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  var namaAgenda = "".obs;
  var waktuAgenda = "".obs;
  var email = "".obs;
  var namadepan = "".obs;
  var namabelakang = "".obs;
  var password = "".obs;
  
  final namaAgendaCtrl = TextEditingController();
  final waktuAgendaCtrl = TextEditingController();
  final namadepanCtrl = TextEditingController();
  final namabelakangCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  onPressed() {
    namaAgenda = namaAgendaCtrl.text.obs;
    waktuAgenda = waktuAgendaCtrl.text.obs;
    namadepan = namadepanCtrl.text.obs;
    namabelakang = namabelakangCtrl.text.obs;
    email = emailCtrl.text.obs;
    password = passCtrl.text.obs;
  }

  // Mirip dispose() di Stateful
  @override
  void onClose() {
    namaAgendaCtrl.dispose();
    waktuAgendaCtrl.dispose();
    namadepanCtrl.dispose();
    namabelakangCtrl.dispose();
    emailCtrl.dispose();
    super.onClose();
  }

}