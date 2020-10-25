import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/doctor.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class DoctorInfo extends StatefulWidget {
  final Doctor doctor;

  DoctorInfo({Key key, this.doctor}) : super(key: key);


  _DoctorInfoState createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
    final snackBarsuppression = SnackBar(content: Text('Vous avez supprimé un Medecin'));
   FirestoreService service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    
    double width =MediaQuery.of(context).size.width;
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70,),
          Column(
            children: [
              Stack(

                children: [
                  ClipPath(
                clipper: OvalRightBorderClipper(),
                child: Container(
                  
                  height: 200,
                  color: Colors.blue[300],
                  child: Center(child: Row(
                    children: [
                      Spacer(),
                      Container(
                                       
                                          width: 190.0,
                                          height: 190.0,
                                          decoration: new BoxDecoration(
                                                              boxShadow: [
                                                                  BoxShadow(
                                                                    offset: const Offset(2.0, 2.0),
                                                                    blurRadius: 1.0,
                                                                    spreadRadius: 1.0,
                                                                  ),
                                                                ],
                                                                border: Border.all(width: 1, color: Colors.grey),
                                                              shape: BoxShape.circle,
                                                              image: new DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage('assets/images/doctor.png')
                                                    )
                                    )),
                        
                           
                                
                    ],
                  )),
                ),
              ),
                ],
                 
              ),
              SizedBox(height: 30,),
                        Container(
                                width:300,
                                  height:50.0,
                                  padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                   borderRadius:BorderRadius.circular(50.0),
                                
                                ),
                                child:Row(
                                      
                                      children:<Widget>[
                                         
                                       
                                        Text(
                                    "Name",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.w100),
                                  ),
                                 
                                   Expanded(
                                        child: Text(
                                      widget.doctor.name,
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontWeight: FontWeight.w100),
                                    )),
                                  
                                     
                                        
                                      ]
                                    ),
                                  
                                ),
                               SizedBox(height:16) ,
                                Container(
                                width:300,
                                  height:50.0,
                                  padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                   borderRadius:BorderRadius.circular(50.0),
                                
                                ),
                                child:Row(
                                      
                                      children:<Widget>[
                                         Icon(Icons.email,color: Colors.grey,),
                                       
                                        Text(
                                    "Email",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.w100),
                                  ),
                                 
                                   Expanded(
                                        child: Text(
                                      widget.doctor.email,
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontWeight: FontWeight.w100),
                                    )),
                                  
                                     
                                        
                                      ]
                                    ),
                                  
                                ),
                             
                                  SizedBox(height:16) ,
                              
                              SizedBox(height:16) ,
                              
                                Container(
                                width:300,
                                  height:50.0,
                                  padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                   borderRadius:BorderRadius.circular(50.0),
                                  
                                ),
                              child:Row(
                                      
                                      children:<Widget>[
                                         
                                       
                                        Text(
                                    "Specialité",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontWeight: FontWeight.w100),
                                  ),
                                  Expanded(
                                      child: Text(
                                    widget.doctor.specialite,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontWeight: FontWeight.w100),
                                  ))
                                     
                                        
                                      ]
                                    ),
                             ),
                             SizedBox(height:50,),
                             IconButton(
                                              icon: new Image.asset('assets/images/trash.png'),
                                             tooltip: 'Supprimer Un Medecin',
                                              onPressed: () {
                                              //service.removeStudent(widget.doctor.email);
                                              Navigator.pop(context);
                                              Scaffold.of(context).showSnackBar(snackBarsuppression);


                                               print("you clicked");
                                                                     
                                                },
                                               ),
            ],
          )
          
        ],
      ),

    );
  }
}