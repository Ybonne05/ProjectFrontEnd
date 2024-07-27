import 'package:bigbrewteatech/pages/OrderCustomizationScreen.dart';
import 'package:flutter/material.dart';
import '../services/product.dart';


class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState(product: product);
}

class _selectedProductState extends State<selectedProduct> {
  final Product product;

  _selectedProductState({required this.product});

  @override
  void initState() {
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.orange[400],
      ),
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                  child: Center(
                    child: Image.network(product.url),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(widget.product.productName,
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           )
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Center(
                          child: Text(widget.product.description,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: OrderCustomizationScreen(productId: product.productId,));
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[600],
                    foregroundColor: Colors.grey[200]
                ),
                child:  const Row(
                  children: <Widget>[
                    Icon(Icons.dashboard_customize),
                    SizedBox(width: 80,),
                    Text(
                      'Customize your order',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}