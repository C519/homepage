import 'dart:ui';

import 'package:posttest6_1915016121_rhennanurlisa/controller/drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'costume_alert.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/checkbox_ctrl.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/radio_ctrl.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/splash_screen.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/text_ctrl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/item_card.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rhennalisa',
      theme: ThemeData(
        hintColor: const Color.fromARGB(255, 66, 43, 35),
      ),
      home: Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
  // State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format =
      CalendarFormat.month; // agar format dalam bulan tampil
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calendar"),
        centerTitle: true,
      ),
      body: TableCalendar(
        // package kalender
        // focusedDay: DateTime.now(),
        focusedDay: selectedDay, //menunjukkan hari ini
        firstDay: DateTime(2021), // menunjukkan kalender dimulai dari tahun brp
        lastDay: DateTime(2030), // menunjukkan berakhirnya kalender

        calendarFormat: format,
        onFormatChanged: (CalendarFormat fformat) {
          //untuk mengubah kalender berdasarkan bulannya atau mingguannya
          setState(() {
            format = fformat;
          });
        },

        startingDayOfWeek: StartingDayOfWeek
            .sunday, //untuk memulai hari dari sunday // memperlihatkan hri dlm sminggu
        daysOfWeekVisible: true,

        //day changed
        onDaySelected: (DateTime selectDay, DateTime focuseDay) {
          setState(() {
            selectedDay = selectDay;
            focusedDay = focuseDay;
          });

          // ignore: avoid_print
          print(focusedDay);
        },

        selectedDayPredicate: (DateTime date) {
          return isSameDay(selectedDay, date);
        },

        //to style the calender
        calendarStyle: CalendarStyle(
          // decoration kalender
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),

          selectedTextStyle: TextStyle(color: Colors.black),
          todayDecoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),

        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonDecoration: BoxDecoration(color: Colors.transparent),
          formatButtonTextStyle: TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
    // );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  static final List<Widget> tabBar = [
    Tab(text: "Peringatan Hari Besar"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lainnya"),
          backgroundColor: Color.fromARGB(255, 15, 162, 108),
          bottom: TabBar(tabs: tabBar),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Text("\t\t \n Sabtu, 1 Januari 2022: Tahun Baru 2022 Masehi"),
                Text(
                    "\n Selasa, 1 Februari 2022: Tahun Baru Imlek 2573 Kongzili "),
                Text(
                    "\n Senin, 28 Februari 2022: Isra Mikraj Nabi Muhammad SAW"),
                Text(
                    "\n Kamis, 3 Maret : Hari Suci Nyepi Tahun Baru Saka 1944"),
                Text("\n Jumat, 15 April : Wafat Isa Almasih"),
                Text("\n Minggu, 1 Mei : Hari Buruh Internasional"),
                Text(
                    "\n Senin-Selasa, 2-3 Mei : Hari Raya Idul Fitri 1443 Hijriyah"),
                Text("\n Senin, 16 Mei : Hari Raya Waisak 2566 BE"),
                Text("\n Kamis, 26 Mei : Kenaikan Isa Almasih"),
                Text("\n Rabu, 1 Juni : Hari Lahir Pancasila"),
                Text("\n Sabtu, 9 Juli : Hari Raya Idul Adha 1443 Hijriyah"),
                Text("\n Sabtu, 30 Juli : Tahun Baru Islam 1444 Hijriyah"),
                Text("\n Rabu, 17 Agustus : Hari Kemerdekaan RI"),
                Text("\n Sabtu, 8 Oktober : Maulid Nabi Muhammad SAW"),
                Text("\n Minggu, 25 Desember : Hari Raya Natal \t "),
              ],
            ),
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
// class agenda {}

class form extends StatelessWidget {
  const form({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGENDA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'AGENDA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Agenda { formal, nonformal, Semiformal }

class _MyHomePageState extends State<MyHomePage> {
  // String namaAgenda = '', waktuAgenda = '';
  // final ctrlNamaAgenda = TextEditingController();
  // final ctrlWaktuAgenda = TextEditingController();

  final TextController tc = Get.put(TextController());
  final CheckBoxController cc = Get.put(CheckBoxController());
  final RadioController rc = Get.put(RadioController());
  bool isNotif = false;
  Agenda agenda = Agenda.formal;

  // @override
  // void dispose() {
  //   ctrlNamaAgenda.dispose();
  //   ctrlWaktuAgenda.dispose();
  //   super.dispose();
  // }

  String getAgenda(Agenda value) {
    if (value == Agenda.formal) {
      return "Formal";
    } else if (value == Agenda.nonformal) {
      return "Nonformal";
    } else if (value == Agenda.Semiformal) {
      return "Semiformal";
    } else
      return '';
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Jadwal = firestore.collection("pemesanan");
    TextEditingController _myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("AGENDA"),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 179, 253, 198),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                  "Jadwal Anda : ${tc.namaAgendaCtrl.text.obs}, ${tc.waktuAgendaCtrl.text.obs}"),
              Text("\nJenis Acara : ${getAgenda(agenda)}"),
              Text(
                  "\n ${isNotif ? "Nyalakan Notifikasi" : "Bisukan Notifikasi"}\n"),
              Divider(
                height: 30,
                thickness: 3,
                color: Color.fromARGB(255, 23, 100, 74),
              ),
              TextField(
                controller: tc.namaAgendaCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Input Agenda",
                  labelText: "Nama Agenda :",
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: tc.waktuAgendaCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Input Waktu",
                  labelText: "Waktu Agenda :",
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      title: Text("Formal"),
                      leading: Obx(
                        () => Radio<Survive>(
                          value: Survive.Formal,
                          groupValue: rc.survive.value,
                          onChanged: (value) {
                            rc.survive(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text("Nonformal"),
                      leading: Obx(
                        () => Radio<Survive>(
                          value: Survive.Nonformal,
                          groupValue: rc.survive.value,
                          onChanged: (value) {
                            rc.survive(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text("Semiformal"),
                      leading: Obx(
                        () => Radio<Survive>(
                          value: Survive.Semiformal,
                          groupValue: rc.survive.value,
                          onChanged: (value) {
                            rc.survive(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text("Nyalakan Notifikasi Agenda"),
                leading: Obx(
                  () => Checkbox(
                    value: cc.checkbox.value,
                    onChanged: (value) {
                      cc.checkbox(value);
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    Jadwal.add({
                      "Nama Agenda": tc.namaAgendaCtrl.text.obs,
                      "Waktu Agenda": tc.waktuAgendaCtrl.text.obs,
                    });
                    tc.namaAgenda = tc.namaAgendaCtrl.text.obs;
                    tc.waktuAgenda = tc.waktuAgendaCtrl.text.obs;
                    tc.onClose();
                  });
                  CustomAlert(context, _myController.text);
                },
                child: Text("Submit"),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Jadwal.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCard(
                              e.get('Nama Agenda'),
                              e.get('Waktu Agenda'),
                              // e.get('guarantee'),
                              onUpdate: () {
                                Jadwal.doc(e.id).update({
                                  "Nama Agenda": tc.namaAgenda.obs,
                                  "Waktu Agenda": tc.waktuAgenda.obs,
                                });
                                tc.namaAgenda = tc.namaAgendaCtrl.text.obs;
                                tc.waktuAgenda = tc.waktuAgendaCtrl.text.obs;

                                tc.onClose();
                              },
                              onDelete: () {
                                Jadwal.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(Hal2()),
        child: Text("2"),
      ),
      drawer: MyDrawer(),
    );
  }
}

class Hal2 extends StatelessWidget {
  Hal2({Key? key}) : super(key: key);

  final TextController tc = Get.find();
  final RadioController rc = Get.find();
  final CheckBoxController cc = Get.find();

  List<Widget> getString(Survive value, context) {
    if (value == Survive.Formal) {
      return [
        Text(
          "Agenda Anda Formal",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Icon(Icons.fastfood),
      ];
    } else if (value == Survive.Nonformal) {
      return [
        Text(
          "Agenda Anda Nonformal",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Icon(Icons.wine_bar),
      ];
    } else if (value == Survive.Semiformal) {
      return [
        Text(
          "Agenda Anda Semiformal",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Icon(Icons.wine_bar),
      ];
    } else {
      return [
        Text(
          "Anda Tidak Memiliki Agenda",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Icon(Icons.question_mark),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman 2"),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Anda Memiliki ${tc.namaAgendaCtrl.text.obs} , ${tc.waktuAgendaCtrl.text.obs}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getString(rc.survive.value, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Detail Agenda Anda : ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    cc.checkbox.value
                        ? 'Nyalakan Notifikasi'
                        : 'Matikan Notifikasi',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
                      color: cc.checkbox.value ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
