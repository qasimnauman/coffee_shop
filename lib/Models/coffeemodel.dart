class CoffeeModel {
  String name;
  String image;
  double price;
  String description;
  bool isfav = true;

  CoffeeModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.isfav,
  });

  CoffeeModel.fromJson(Map<String, Object?> json)
   : this(
      name: json['name']! as String,
      image: json['image']! as String,
      price: json['price']! as double,
      description: json['description']! as String,
      isfav : json['isfavourite'] as bool,
  );

  Map<String, Object> toJson()
  {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'isfavourite' : isfav,
    };
  }
}