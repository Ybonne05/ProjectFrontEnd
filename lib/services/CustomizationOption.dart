class CustomizationOption{
  final int productId;
  final int sugarLevel;
  final String cupSize;
  final int quantity;
  final double totalAmount;


  CustomizationOption({
    required this.productId,
    required this.sugarLevel,
    required this.cupSize,
    required this.quantity,
    required this.totalAmount,});

  factory CustomizationOption.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'productId' : int productId,
      'sugarLevel' : int sugarLevel,
      'cupSize' : String cupSize,
      'quantity' : int quantity,
      'totalAmount' :  double totalAmount,
      } =>
          CustomizationOption(
            productId: productId,
            sugarLevel:  sugarLevel,
            cupSize: cupSize,
            quantity: quantity,
            totalAmount: totalAmount,
          ),
      _ => throw const FormatException('Failed to load customization')
    };
  }
}