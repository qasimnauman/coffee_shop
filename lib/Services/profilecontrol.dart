import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileControl extends GetxController {
  static ProfileControl get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var userData = UserModel().obs;

  // Method to get user data
  Future<void> getUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        userData.value = UserModel.fromMap(snapshot.data()!);
      } else {
        Get.snackbar('Error', 'User not found');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to get user data');
    }
  }

  // Method to update user data in Firestore
  Future<void> updateUserData(String uid, UserModel newUserData) async {
    try {
      await _firestore.collection('users').doc(uid).update(newUserData.toMap());
      userData.value = newUserData; // Update local data
    } catch (e) {
      Get.snackbar('Error', 'Failed to update user data');
    }
  }
}

// Example UserModel class (make sure you adjust this to your actual user model)
class UserModel {
  String? uid;
  String? name;
  String? email;

  UserModel({this.uid, this.name, this.email});

  // Method to create a UserModel instance from a map
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
    );
  }

  // Method to convert a UserModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }
}
