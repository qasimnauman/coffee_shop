import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController{
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async
  {
    await _db.collection("Users").add(
      user.toJson()
    ).whenComplete(() => Get.snackbar(
      "Sucess", "You account has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white
      )
    )
    .catchError((error,stackTrace)
    {
      Get.snackbar(
      "Error", "Something went wrong",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white
      );
      print(error);
    });
  }

  Future<UserModel> getUser(String id) async
  {
    final doc = await _db.collection("Users").where("id", isEqualTo: id).get();
    final userData = doc.docs.map((doc) => UserModel.fromSnapshot(doc)).single;
    return userData;
  }

  Future<List<UserModel>> allusers() async
  {
    final doc = await _db.collection("Users").get();
    final userData = doc.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    return userData;
  }
}