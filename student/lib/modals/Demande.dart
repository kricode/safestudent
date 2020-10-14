
class Demande{
  

  String id;
  String name;
  String email;
  String password;
  DateTime anniv;
  String cas;
  String departement;
  String image;
  String role;

  Demande({this.id ,this.name, this.email, this.password, this.cas, this.departement, this.image, this.role, this.anniv});

   
  
          
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'password': password,
    'cas': cas,
    'departement': departement,
    'image': image,
    'role' : role,
    'anniv' : anniv
   
    };
  }

   Demande.fromFirestore(Map<String, dynamic> firestore)
      : id= firestore['id'],
        name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'],
        cas = firestore['cas'],
        departement = firestore['departement'],
        image = firestore['image'],
        role = firestore['role'],
        anniv = firestore['anniv']
        ;
}


