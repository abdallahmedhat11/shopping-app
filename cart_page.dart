import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});


  @override
  State<CartPage> createState() => _CartPageState();
}

List<Product> carts = [];

class _CartPageState extends State<CartPage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 47, 139, 185),
      ),
      body: Container(
        color: const Color.fromARGB(221, 255, 255, 255),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: carts.length,
          itemBuilder: (context, i) => Card(
            child: ListTile(
              title: Text(carts[i].name),
              subtitle: Text(carts[i].price),
              leading: Text("${i + 1}"),
              trailing: Image.network("${carts[i].imageUrl}"),
            ),
          ),
        ),
      ),
    );
  }
}