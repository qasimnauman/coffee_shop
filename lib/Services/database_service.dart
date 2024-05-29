import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Models/coffeemodel.dart';
import 'package:coffee_shop/Models/colddrinksmodel.dart';

const String coffeeCollection = 'Coffee';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _coffeeref;

  DatabaseService() {
    _coffeeref = _firestore.collection(coffeeCollection).withConverter<CoffeeModel>(
      fromFirestore: (snapshot, _) => CoffeeModel.fromJson(snapshot.data()!),
      toFirestore: (coffee, _) => coffee.toJson(),
    );
  }

  Stream<QuerySnapshot> getCoffee() {
    return _coffeeref.snapshots();
  }

  void addCoffee(CoffeeModel coffee) {
    _coffeeref.add(coffee);
  }

  void updateLike(String coffeeid, bool isliked){
    _coffeeref.doc(coffeeid).update({'isfav': isliked});
  }
}

class ColdDrinkDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _colddrinkref;

  ColdDrinkDBService() {
    _colddrinkref = _firestore.collection('ColdDrinks').withConverter<ColdDrinkModel>(
      fromFirestore: (snapshot, _) => ColdDrinkModel.fromJson(snapshot.data()!),
      toFirestore: (coffee, _) => coffee.toJson(),
    );
  }

  Stream<QuerySnapshot> getColdDrink() {
    return _colddrinkref.snapshots();
  }

  void addColdDrink(ColdDrinkModel colddrink) {
    _colddrinkref.add(colddrink);
  }

  void updateLike(String coldid, bool isliked){
    _colddrinkref.doc(coldid).update({'isfav': isliked});
  }
}