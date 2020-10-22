import 'package:flutter/material.dart';
import 'package:projet/EtudiantUi/maladies.dart';


class AssistancePage extends StatefulWidget {
  
  @override
  _AssistancePageState createState() => _AssistancePageState();
}


class _AssistancePageState extends State<AssistancePage> {
  /* List<Maladies> maladie= [
    Maladies(nom: 'Le diabète'),
    Maladies(nom: 'La maladie de corhn'),
    Maladies(nom: 'La grippe'),
    Maladies(nom: 'Insuffisance cardiaque'),
    Maladies(nom: 'La maigrine'),
    Maladies(nom: 'hypotension'),
    Maladies(nom: 'Covid-19'),
    Maladies(nom:"Endométriose"),
   
  ];
  get selectedmaladie => (selectedmaladie);*/
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("la liste des maladies"),
        centerTitle:true,
        backgroundColor: Color(0xFF9578CD),
      ),
      body: ListView.builder(
       // itemCount:maladie.length,
             itemBuilder: (context,index){
                return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                   child: InkWell(
                  onTap: () {/*
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
  switch (selectedmaladie) {
    case 'Le diabète':
      return Diabete();
    break;
    case 'La maladie de corhn':
      return CohrnPage();
    break;
    case 'La grippe':
      return GrippePage();
      break;
       case 'Insuffisance cardiaque':
      return CardioPage();
    break;
    case 'La maigrine':
      return MaigrinePage();
    break;
   default:
    return Diabete();
   
  }
}));*/
                  },
                  
                  child: Card(
                  
                child: ListTile(
                // title:Text(maladie[index].nom, style: Theme.of(context).textTheme.headline6),
                 hoverColor:Color(0xFF9578CD),
                ),
                ),
                )
                );
             }
             
      ),
    );
  }
}