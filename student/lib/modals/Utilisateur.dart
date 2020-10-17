
class uti{
  

  
  String name;
  String email;
  String password;
  String role;
 

  uti({this.name, this.email, this.password, this.role});

   
  
          
  Map<String,dynamic> toMap(){
    return {
    'name' : name,     
    'email': email,
    'password': password,
    'role': role,
   
    };
  }

   uti.fromFirestore(Map<String, dynamic> firestore)
      :
        name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'],
        role = firestore['role']
      
        ;
}


