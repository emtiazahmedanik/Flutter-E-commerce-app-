class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrls;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photoUrls
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
        id: jsonData['_id'] ?? 'null',
        title: jsonData['title'] ?? 'null',
        currentPrice: jsonData['current_price'] ?? 'null',
        photoUrls: List<String>.from(jsonData['photos'])
    );
  }
}
