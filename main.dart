import 'package:agenda_flutter/services/theme_services.dart';
import 'package:agenda_flutter/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:agenda_flutter/ui/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //buat hilangin watermark debug
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
     
      home:  HomePage()
    );
  }
}
