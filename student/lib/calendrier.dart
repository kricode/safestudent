import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';


import 'main.dart';

class Calendrier extends StatefulWidget{
  @override
  _CalendrierState  createState()=> _CalendrierState();
  }
  class _CalendrierState extends State<Calendrier> {
    CalendarController _controller;
    Map<DateTime,List<dynamic>> _events;
    List<dynamic> _selectedEvents;
    TextEditingController _eventsController;
    SharedPreferences prefs;
    @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    
    _controller=CalendarController();
    _events={};
    _eventsController=TextEditingController();
    _selectedEvents=[];
    initPrefs();
  }
  initPrefs()async{
    prefs= await SharedPreferences.getInstance();
    setState(() {
       _events=Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString
    ("events")??"{}")));
    });
   
  }
  Map<String,dynamic> encodeMap (Map<DateTime,dynamic>map){
   Map<String,dynamic> newMap={};
   map.forEach((key, value) {
     newMap[key.toString()]=map[key];
   });
   return newMap;
  }
   Map<DateTime,dynamic> decodeMap (Map<String,dynamic>map){
   Map<DateTime,dynamic> newMap={};
   map.forEach((key, value) {
     newMap[DateTime.parse(key)]=map[key];
   });
   return newMap;
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(

          children:<Widget>[
           
                 ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 200,
                  color: Color(0xFF9578CD),
                   child: Center(child: Text("my calendar",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                  
                  
                ),
                
            ),
            SafeArea(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                         children:<Widget> [
                           Container(
                             height:64,
                             margin:EdgeInsets.only(bottom:40),
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children:<Widget> [
                                 
                                Align(
                             child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                              color: Colors.black,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                      
                
                            onPressed: (){
                              Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => HomeScreen()),
              );
                            },
                            ),
                            ),
                        
                             ],
                             ),
                             
                           ),
                           SizedBox(height:60),
                           Container(
                          
          child: Column(
            children: [
              TableCalendar(
                events: _events,
                initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                  todayColor: Color(0xFF9578CD) ,
                  todayStyle: TextStyle(
                   fontWeight:FontWeight.bold,
                   fontSize: 18.0,
                   color: Colors.white,

                  ),
                  selectedColor: Theme.of(context).primaryColorLight,
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color:Color(0xFF9578CD),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    formatButtonTextStyle: TextStyle(
                      color:Colors.white,
                    ),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  onDaySelected: (date,events){
                 setState(() {
                   _selectedEvents=events;
                 });
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder:(context,date,events)=>Container(
                       margin: EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:Colors.purple[200],
                        shape:BoxShape.circle,
                      ),
                      child: Text(date.day.toString(),style: TextStyle(
                        color:Colors.white,
                      ),)
                      )
                  ),
                calendarController: _controller,
                ),
               ... _selectedEvents.map((event) => ListTile(
                  title: Text(event),
                  )),
            ],
          ),
            
                           )
                         ],
                                              ),
                                            ),
            ),
            
          ],
          
        ),
      
        floatingActionButton: FloatingActionButton(
          backgroundColor:Color(0xFF9578CD),
          child:Icon(Icons.add),
          onPressed: _showAddDialog,
        ),

    );

    }
        _showAddDialog(){
      showDialog(
        context: context,
      builder:(context)=> Expanded(
                
                  child: AlertDialog(
                content: TextField(
                  controller: _eventsController,
                
                ),
                actions:<Widget> [
                  FlatButton(
                    onPressed: (){
                         if(_eventsController.text.isEmpty)return;
                         setState(() {
                           if(_events[_controller.selectedDay] != null){
                           _events[_controller.selectedDay].add(_eventsController.text);

                         }else{
                           _events[_controller.selectedDay]=[_eventsController.text];
                         }
                         prefs.setString("events", json.encode(encodeMap(_events)));
                         _eventsController.clear();
                         Navigator.pop(context);
                         });
                         
                    }, 
                  child: Text("save"),color:Color(0xFF9578CD),)
                ],
              ),
          
        ),
      
      
      );
    }
  }