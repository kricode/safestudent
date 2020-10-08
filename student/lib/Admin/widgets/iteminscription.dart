import 'package:flutter/material.dart';

class iteminscription extends StatelessWidget {

  const iteminscription({Key key}) : super(key: key);

  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: 100.0,
              margin: const EdgeInsets.only(bottom: 5.0), //Same as `blurRadius` i guess
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                               //Ici nous allons faire montrer la foto et le nom prenom
                                //nous avons decider de tout separer comme ça il sera plus simple
                                //pour generer l'interface graphique
                                width: 50,
                                  decoration: new BoxDecoration(
                                                      boxShadow: [
                                                          BoxShadow(
                                                            offset: const Offset(2.0, 2.0),
                                                            blurRadius: 1.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image:AssetImage('assets/etudiant.png')
                                            )
                            )),
                            SizedBox( width: 30,),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text(" Name", style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Cardo',
                                  ),),
                                  Text('last name', style: TextStyle(fontSize: 15, color: Colors.grey))
                                ],
                              ),
                            ),
                      ],
                    ),
                    Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(' departement', style: TextStyle(
                                    fontSize: 18,
                                 ),),
                                 SizedBox(width: 20),

                                 Text(' Maladie ........', style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red[200]
                                 ),),

                                 SizedBox(width: 30,),

                                 Text('Nom Maladie', style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey
                                 ),),
                                 SizedBox(width: 20),



                              ],
                            ),
                            RaisedButton(
                                        shape: StadiumBorder(),
                                        color: Colors.green[100],
                                        onPressed: () {},
                                        child: Text("Inscrire"),
                                      ),
                             RaisedButton(
                                        shape: StadiumBorder(),
                                        color: Colors.red[100],
                                        onPressed: () {},
                                        child: Text("Supprimer"),
                                      )

                  ],
                )

              )
            ),
          ),
        ),
      ),
    );
  }
}