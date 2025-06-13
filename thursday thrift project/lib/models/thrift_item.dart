class ThriftItem {
  final String id;
  final String title;
  final String brand;
  final double price;
  final String imageUrl;
  final List<String> tags;
  final String description;

  ThriftItem({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.imageUrl,
    required this.tags,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'price': price,
      'imageUrl': imageUrl,
      'tags': tags,
      'description': description,
    };
  }

  factory ThriftItem.fromJson(Map<String, dynamic> json) {
    return ThriftItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      description: json['description'] ?? '',
    );
  }
} 