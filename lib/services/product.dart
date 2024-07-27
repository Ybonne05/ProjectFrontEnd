class Product{
  int productId;
  String productName;
  String description;
  String url;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.url,});

  factory Product.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'productId' : int productId,
      'productName' : String productName,
      'description' : String description,
      'url' : String url
      } =>
          Product(
              productId:  productId,
              productName: productName,
              description: description,
              url: url,
          ),
      _ => throw const FormatException('Failed to load products')
    };
  }
}