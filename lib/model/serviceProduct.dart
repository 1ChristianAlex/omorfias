class ServiceProduct {
  final int id;
  final int categoryEnum;
  final double price;
  final double oldPrice;
  final String title;
  final String description;
  final String url;

  ServiceProduct({
    this.id,
    this.categoryEnum,
    this.price,
    this.oldPrice,
    this.title,
    this.url,
    this.description,
  });

  factory ServiceProduct.fromJson(dynamic json) {
    return ServiceProduct(
        id: json['id'],
        categoryEnum: json['categoryEnum'],
        price: json['price'],
        title: json['title'],
        url: json['url'],
        description: json['description']);
  }
}
