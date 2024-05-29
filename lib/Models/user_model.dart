
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String password;

  const UserModel({
    required this.id,
    required this.name,
    required this.password
    });

  toJson()
  {
    return {
      'id': id,
      'name': name,
      'password': password
    };
  }

  factory UserModel .fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot)
  {
    final data = snapshot.data()!;
    return UserModel(
      id: snapshot.id,
      name: data['name'],
      password: data['password']
    );
  }
}