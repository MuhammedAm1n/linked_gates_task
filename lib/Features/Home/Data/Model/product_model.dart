class ProductModel {
  final int id;
  final String title;
  final String image;
  final int price;

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map["id"],
        title: map["title"],
        image: map["images"][0],
        price: map["price"]);
  }

  ProductModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
}
