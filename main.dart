
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
      title: 'GamingShop Cihuy',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> shops = [

      {
        'name' : 'Playstation 5',
        'image' : 'https://images.unsplash.com/photo-1622297845775-5ff3fef71d13?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'description' : 'console gaming terbaru yuk main gta 6',
        'stock' : '15 unit',
        'harga' : 'Rp 12.000.000'
      },
      {
        'name' : 'playstation 4',
        'image' : 'https://images.unsplash.com/photo-1625645758520-69e4db363b8d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'description' : 'ps 4 masih jaman yuk dibeli sekarang..',
        'stock' : '30 unit',
        'harga' : 'Rp 3.500.000'
      },
      {
        'name' : 'playstation 3',
        'image' : 'https://images.unsplash.com/photo-1526510096283-b0b3b6cac327?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'description' : 'beli yuk gays dijamin seru..',
        'stock' : '20 unit',
        'harga' : 'Rp 2.000.000'
      },
      {
        'name' : 'playstation 2',
        'image' : 'https://images.unsplash.com/photo-1550340733-4c0bdcfe1187?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'description' : 'nostalgia dulu yuk',
        'stock' : '5 unit',
        'harga' : 'Rp 1.200.000'
      },
      {
        'name' : 'playstation 1',
        'image' : 'https://images.unsplash.com/photo-1531390658120-e06b58d826ea?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
        'description' : 'nostalgia yuk dengan ps 1',
        'stock' : '17 unit',
        'harga' : 'Rp 500.000'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Align(
          child: Text('GamingShop Cihuy'),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: Icon(Icons.shopping_bag_sharp),
        actions: [
          Icon(Icons.shopping_bag_sharp)
        ],
        
      ),
      body: ListView.builder(
      itemCount: shops.length,
      itemBuilder: (context, index) {
        final shop = shops[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
            color: Colors.grey,
            child: ListTile(
              leading: ClipRect(
                child: Image.network(
                  shop['image']!,
                  width: 60,
                  height: 65,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      child: Icon(Icons.shopping_bag_sharp),
                    );
                  }
                ),
              ),

              title: Text(
                shop['name']!,
                style: TextStyle(fontWeight: .bold, fontSize: 20),
              ),

              subtitle: Text(
                shop['description']!,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right,fontWeight: .bold,),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: shop['name']!,
                      image: shop['image']!,
                      description: shop['description']!,
                      stock: shop['stock']!,
                      harga: shop['harga']!,

                    ),
                  )
                );
              },
            ),
          );
        },
      ),
    );
  }
}