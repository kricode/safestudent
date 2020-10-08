import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import './widgets/avatar.dart';
import './widgets/iteminscription.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acceuil',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
 @override
  Widget Widget1  (BuildContext ontext){
    return Container(child: Text("this is the acceuil"),);
  }
  int _currentIndex = 0;
//final List<Widget> _pages = [Widget1(), Widget2()];

@override
Widget build(BuildContext context) {
  return MaterialApp(

    title: 'Safe Student',
    home: BackdropScaffold(
      
      appBar: BackdropAppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Acceuil"),
        
      ),
      stickyFrontLayer: true,
     // frontLayer: _pages[_currentIndex],
      backLayer: BackdropNavigationBackLayer(
        items: [
          ListTile(title: Text("Acceuil")),
          ListTile(title: Text("Deconnexion")),
        ],
        onTap: (int position) => {setState(() => _currentIndex = position)},
      ),
      frontLayer: Container(
        child: Center(
         child: iteminscription(),
        )
      )
    ),
    
  );

    
  }

 
}
