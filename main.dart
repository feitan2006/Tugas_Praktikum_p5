
import 'package:flutter/material.dart';
import 'package:p5_naufal/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodShop Cihuy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foods = [
      {
        'name': 'Burger Special',
        'image': 'https://images.unsplash.com/photo-1571091655789-405eb7a3a3a8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'harga': 'Rp 50.000',
        'description': 'Burger lezat dengan daging sapi juicy, keju, sayuran segar dan saus spesial.',
      },
      {
        'name': 'Pizza Cheese',
        'image': 'https://plus.unsplash.com/premium_photo-1733306588881-0411931d4fed?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'harga': 'Rp 100.000',
        'description': 'Pizza dengan topping keju mozzarella melimpah dan saus tomat pilihan.',
      },
      {
        'name': 'Sushi Jepang',
        'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500',
        'harga': 'Rp 125.000',
        'description': 'Sushi khas Jepang dengan nasi pulen dan ikan segar.',
      },
      {
        'name': 'Fried Chicken',
        'image': 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500',
        'harga': 'Rp 30.000',
        'description': 'Ayam goreng crispy dengan bumbu gurih dan kulit renyah.',
      },
      {
        'name': 'Mie Ramen',
        'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
        'harga': 'Rp 35.000',
        'description': 'Mie ramen hangat dengan kuah gurih, telur dan topping pilihan.',
      },
      {
        'name': 'Pasta Spaghetti',
        'image': 'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=500',
        'harga': 'Rp 95.000',
        'description': 'Spaghetti dengan saus tomat khas Italia dan taburan keju.',
      },
      {
        'name': 'French Fries',
        'image': 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500',
        'harga': 'Rp 40.000',
        'description': 'Kentang goreng renyah dengan rasa gurih dan cocok untuk camilan.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FoodShop Cihuy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.restaurant_menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Temukan makanan favoritmu di sini 🍔',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Menu Makanan',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ),

          // LIST MAKANAN
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        food['image']!,
                        width: 85,
                        height: 85,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 85,
                            height: 85,
                            color: Colors.orange.shade100,
                            child: const Icon(
                              Icons.fastfood,
                              size: 35,
                              color: Colors.deepOrange,
                            ),
                          );
                        },
                      ),
                    ),

                    title: Text(
                      food['name']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          food['description']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          food['harga']!,
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.deepOrange,
                      size: 18,
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            name: food['name']!,
                            image: food['image']!,
                            description: food['description']!,
                            harga: food['harga']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
