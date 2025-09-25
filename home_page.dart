import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});


  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Product> carts = [];

class _HomePageState extends State<HomePage> {
   int _currentPage = 0;
  List images = [
    "https://img.freepik.com/premium-photo/black-friday-wirh-shpping-bag-gift-box-online-shopping-concept-black-friday_175994-64051.jpg",
    "https://wowtovisit.com/wp-content/uploads/2023/09/img_0900-1024x576.jpg",
    "https://img.freepik.com/premium-photo/online-shopping-concept-mobile-phone-smartphone-generative-ai_887552-8974.jpg",
  ];

  List collection = [
    "https://pngimg.com/uploads/macbook/macbook_PNG68.png",
    "https://i.pinimg.com/originals/74/37/9e/74379ebc69f670571055fea9e6233123.png",
    "https://th.bing.com/th/id/R.f09b3bd023e5541c2ec17f074eb2417c?rik=oPT6PtJzKr8p%2fA&pid=ImgRaw&r=0",
    "https://pngimg.com/uploads/backpack/backpack_PNG6333.png",
    "https://th.bing.com/th/id/R.13c3f4f6f5ab81585866df4235e9c5eb?rik=zsJMEiYlod6Sqg&pid=ImgRaw&r=0",
    "https://i.ibb.co/5VZ2P3f/OIP-removebg-preview.png",
  ];
  List names = [
    "Apple Mackbook",
    "Wireless Headphones",
    "Smart Watch",
    "Backpack",
    "Gaming Keyboard",
    "Logitech Mouse",
  ];
  List description = [
    "Powerful performance for work and play.",
    "Crystal-clear sound without the wires.",
    "Stay connected and track your fitness.",
    "Premium materials with modern style.",
    "Smooth, responsive keys for fast typing.",
    "Precise tracking with ergonomic design.",
  ];

  List price = ["2600\$", "200\$", "700\$", "250\$", "900\$", "190\$"];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 82, 68, 188),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Our Products",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 47, 139, 185),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),

          Container(
            height: 200,
            width: 400,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network("${images[index]}");
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (i) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _currentPage == i ? 20 : 15,
                height: _currentPage == i ? 20 : 15,
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == i ? Colors.blue : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
              );
            }),
          ),

          SizedBox(height: 20),

          Text(
            " Tech Collection",
            style: TextStyle(
              fontFamily: "Suwannaphum-Bold",
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            "${collection[index]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          left: 115,
                          top: 0,
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${names[index]} added to the cart",
                                    style: TextStyle(
                                      fontFamily: "Suwannaphum-Bold",
                                      fontSize: 17,
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    82,
                                    68,
                                    188,
                                  ),
                                ),
                              );
                              carts.add(
                                Product(
                                  name: "${names[index]}",
                                  price: "${price[index]}",
                                  imageUrl: "${collection[index]}",
                                ),
                              );
                              setState(() {});
                            },
                            icon: Icon(Icons.shopping_cart),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${names[index]}",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 15,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Text(
                      "${price[index]}",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 15,
                        color: Color.fromARGB(255, 72, 58, 175),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Text(
            " Hot Offers 🔥",
            style: TextStyle(
              fontFamily: "Suwannaphum-Bold",
              fontSize: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    height: 70,
                    child: Card(
                      elevation: 8.5,
                      shadowColor: const Color.fromARGB(255, 169, 167, 163),
                      child: Row(
                        children: [
                          Text(
                            "${description[index]}",
                            style: TextStyle(
                              fontFamily: "Suwannaphum-Bold",
                              fontSize: 15,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Expanded(
                            child: Image.network("${collection[index]}"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}