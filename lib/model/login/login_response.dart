
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class UserModel {
  String? user_id;
  String? user_name;
  String? email;
  String? password;
  String? dob;
  String? salary;
  String? address;

  UserModel(this.user_id, this.user_name, this.email, this.password,this.address,this.salary,this.dob);
  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
  Map<String,dynamic> toJson()=> _$UserModelToJson(this);
 /* Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
      'address': address,
      'salary': salary,
      'dob': dob
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
    address = map['address'];
    dob = map['dob'];
    salary = map['salary'];





  }*/
}