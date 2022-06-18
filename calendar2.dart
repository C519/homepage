// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:table_calendar_test/event.dart';


// class Calendar extends StatefulWidget {

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {

//   // Map<DateTime,List<Event>> selectedEvents;
//   Map<DateTime, List<Event>> selectedEvents;
//   CalendarFormat format = CalendarFormat.month; // agar format dalam bulan tampil
//   DateTime selectedDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();

//   TextEditingController _evetController = TextEditingController();
  
//   @override
//   void initState() {
//     selectedEvents ={};
//     super.initState();
//   }

//   List<Event> _getEventsfromDay(DateTime date){
//     return selectedEvents [date]??[];
//     }

//   @override
//   void dispose() {
//     _evetController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       title: const Text("My Calendar"),
//     centerTitle: true,
//       ),
//       body: TableCalendar( // package kalender
//         // focusedDay: DateTime.now(),
//         focusedDay: selectedDay, //menunjukkan hari ini
//         firstDay: DateTime(2021),  // menunjukkan kalender dimulai dari tahun brp
//         lastDay: DateTime(2030), // menunjukkan berakhirnya kalender

//         calendarFormat: format, 
//         onFormatChanged: (CalendarFormat fformat){ //untuk mengubah kalender berdasarkan bulannya atau mingguannya
//           setState(() {
//             format = fformat;
//             });
//           },

//           startingDayOfWeek: StartingDayOfWeek.sunday, //untuk memulai hari dari sunday // memperlihatkan hri dlm sminggu
//           daysOfWeekVisible: true,

//             //day changed
//           onDaySelected: (DateTime selectDay,DateTime focuseDay) {

//             setState(() {
//               selectedDay = selectDay;
//               focusedDay = focuseDay;
//             });

//               // ignore: avoid_print
//             print(focusedDay);
//           },

//           selectedDayPredicate: (DateTime date) {
//             return isSameDay(selectedDay, date);
//           },

//           eventLoader: _getEventsfromDay,
            
//             //to style the calender
//           calendarStyle: CalendarStyle( // decoration kalender
//             isTodayHighlighted: true,
//             selectedDecoration: BoxDecoration(
//               color: Colors.blue,
//               shape: BoxShape.circle,
//             ),

//             selectedTextStyle: TextStyle(color: Colors.black), 
//             todayDecoration: BoxDecoration(
//               color: Colors.red, 
//               shape: BoxShape.circle,
//             ),
//           ),

//           headerStyle: HeaderStyle(
//             formatButtonVisible: true,
//             titleCentered: true, 
//             formatButtonShowsNext: false, 
//             formatButtonDecoration: 
//             BoxDecoration(color: Colors.transparent
//             ),
//             formatButtonTextStyle: TextStyle(
//               color: Colors.blueGrey,
//             ),
//           ),
//         ),
        
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () ==> showDialog (
//             context: context, 
//             builder: (context) ==> AlertDialog(
//               title: Text("Add Event"), 
//               content: TextFormFiled(controller: _evetController,),
//               actions: [
//                 TextButton(
//                   child: Text("Back"),
//                   onPressed: () ==> Navigator.pop(context),
//                 ),
//                 TextButton(
//                   child: Text("Ok"),
//                   onPressed: () {
//                     if(_evetController.text.isEmpty){
//                       Navigator.pop(context);
//                       return;
//                     }else{
//                       if(selectedEvents[selectedDay]!=null){
//                         selectedEvents[selectedDay].add(
//                           Event(title: _evetController.text),
//                         );
//                       }else{
//                         selectedEvents[selectedDay]= [
//                           Event(title: _evetController.text),
//                         ];
//                       }
//                       Navigator.pop(context);
//                       _evetController.clear();
//                       return;
//                     }

//                   },
//                 ),
//               ],
//             ),
//           ), 
//           label: Text("Add Event"),
//           icon: Icon(Icons.add),
//         ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:table_calendar_test/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY CALENDAR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(2021),
            lastDay: DateTime(2030),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat fformat) {
              setState(() {
                format = fformat;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selDay, DateTime focuDay) {
              setState(() {
                selectedDay = selDay;
                focusedDay = focuDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle( // decoration kalender
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 122, 189, 244),
              shape: BoxShape.circle,
            ),

            selectedTextStyle: TextStyle(color: Colors.black), 
            todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 116, 107), 
              shape: BoxShape.circle,
            ),
          ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]?.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Map<DateTime, List<Event>>>('selectedEvents', selectedEvents));
  }
}