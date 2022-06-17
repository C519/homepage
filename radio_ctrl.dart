import 'package:get/get.dart';
enum Survive { Formal, Nonformal, Semiformal }

class RadioController extends GetxController {
  // Dijadikan .obs supaya library GetX tau bahwa variable ini mau dijadikan global state
  var survive = Survive.Formal.obs;
  // Saat sebuah variable dibuat dengan .obs, variable otomatis mendapatkan sebuah getter dan setter
  // Cara akses nya:
  // Untuk getter => object.namaVarible.value
  // Untuk setter => object.namaVariable()

  // Bisa dipanggil di onChanged Radio
  onChanged (value) {
    survive(value);
  }
}