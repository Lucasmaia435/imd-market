class Product {
  final String code;
  final String name;
  final String description;
  final int storage;

  Product({
    required this.code,
    required this.name,
    required this.description,
    required this.storage,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'storage': storage,
    };
  }
}
