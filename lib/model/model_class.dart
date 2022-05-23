



class ModelUser{

  String? name;
  String? age;
  String? phone;
  String? email;
  String? uid;

  ModelUser({this.name, this.age, this.phone, this.email, this.uid});

  // ignore: empty_constructor_bodies
  factory ModelUser.fromMap(map){
    
    return ModelUser(
        name:map['name'],
        age:map['age'],
        phone:map['phone'],
        email:map['email'],
        uid:map['uid']
    );
  }

  Map<String,dynamic> toMap(){

    return {
      'uid':uid,
      'name':name,
      'age':age,
      'uid':uid,
      'phone':phone
    };
  }

}
