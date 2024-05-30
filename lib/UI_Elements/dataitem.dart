
class DataItemDetail{
  String title;
  String image;
  String description;
  double price;
  bool isfav = false;

  DataItemDetail({required this.title, required this.image, required this.description, required this.price, required this.isfav});

  DataItemDetail.fromJson(Map<String, Object?> json)
   : this(
      title: json['name']! as String,
      image: json['image']! as String,
      price: json['price']! as double,
      description: json['descrption']! as String,
      isfav : json['isfav']! as bool,
  );
}