class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  dynamic price;
  String description;
  Category category;
  String image;
  Rating rating;
}

// ignore: constant_identifier_names
enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;
}
