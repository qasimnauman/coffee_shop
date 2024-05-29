import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Models/coffeemodel.dart';

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
}

class ColdDrinkDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _colddrinkref;

  ColdDrinkDBService() {
    _colddrinkref = _firestore.collection('ColdDrinks').withConverter<CoffeeModel>(
      fromFirestore: (snapshot, _) => CoffeeModel.fromJson(snapshot.data()!),
      toFirestore: (coffee, _) => coffee.toJson(),
    );
  }

  Stream<QuerySnapshot> getColdDrink() {
    return _colddrinkref.snapshots();
  }

  void addColdDrink(CoffeeModel coffee) {
    _colddrinkref.add(coffee);
  }
}