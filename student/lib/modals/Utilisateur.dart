
class uti{
  

  
  String name;
  String email;
  String password;
 

  uti({this.name, this.email, this.password});

   
  
          
  Map<String,dynamic> toMap(){
    return {
     
    'email': email,
    'password': password,
   
    };
  }

   uti.fromFirestore(Map<String, dynamic> firestore)
      :
        name = firestore['name'],
        email = firestore['email'],
        password = firestore['password']
      
        ;
}


