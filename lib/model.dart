class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}

class ProductModel {
  final String name;
  final String image;
  double price;
  double totalprice;
  int quantity;
  final String rate;
  final String rateCount;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.totalprice,
    required this.quantity,
    required this.rate,
    required this.rateCount,
  });
}
