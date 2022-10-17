import 'package:flutter/material.dart';

import '../data.dart';
import '../models/product_model.dart';
import '../widgets/product_widget.dart';

class EcommerceMainScreen extends StatelessWidget {
  List<Product> convertMapsToProducts() {
    return data.map((e) => Product.fromMap(e)).toList();
  }

  late List<Product> products;
  EcommerceMainScreen() {
    products = convertMapsToProducts();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECOMMERCE'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Pictures:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic1.jpg'))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic2.jpg'))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic3.jpg'))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic4.jpg'))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic5.jpg'))),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pic6.jpg'))),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Text(
              ' Products:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 800,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemCount: products.length,
                  itemBuilder: (c, index) {
                    return ProductWidget(products[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
