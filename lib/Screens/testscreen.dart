import 'package:coffee_shop/Models/coffeemodel.dart';
import 'package:coffee_shop/Services/database_service.dart';
import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  Testing({super.key});

  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Testing'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: _databaseService.getCoffee(),
              builder: ((context, snapshot) {
                List coffeeitems = snapshot.data?.docs ?? [];
                if(coffeeitems.isEmpty) {
                  return const Center(
                    child: Text('No Coffee Items'),
                  );
                }
                return ListView.builder(
                  itemCount: coffeeitems.length,
                  itemBuilder: (context, index) {
                    CoffeeModel coffee = coffeeitems[index].data();
                    return ListTile(
                      title: Column(
                        children: [
                          Text(coffee.name),
                          Text(coffee.price.toString()),
                          Text(coffee.image),
                          Text(coffee.description),
                          Text(coffee.isfav.toString())
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      )
    );
  }
}