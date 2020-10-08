import 'package:flutter/material.dart';


class avatar extends StatelessWidget {
  const avatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
                  alignment: FractionalOffset.center,

            child: Column(
              children: [
                SizedBox(height: 50,),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                            children: [
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
                                                        image:AssetImage('assets/etudiant.png')
                                              )
                              )),
                              SizedBox(height: 30,),
                              Text('Etudiants', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        Column(
                            children: [
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
                                                        image: AssetImage('assets/doctor.png')
                                              )
                              )),
                              SizedBox(height: 30,),
                              Text('Medecins', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
                            ],
                          ),
                          
                  ],
                ),
                  
              ],
            ),
      ),
    );
  }
}