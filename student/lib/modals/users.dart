
class Users{
  

  String id;
  String name;
  String email;
  String password;
  String cas;
  String departement;
  String image;

  Users({this.id ,this.name, this.email, this.password, this.cas, this.departement, this.image});

   
  
          
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'password': password,
    'cas': cas,
    'departement': departement,
    'image': image,
   
    };
  }

   Users.fromFirestore(Map<String, dynamic> firestore)
      : id= firestore['id'],
        name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'],
        cas = firestore['cas'],
        departement = firestore['departement'],
        image = firestore['image']
        ;
}


