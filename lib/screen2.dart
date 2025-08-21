import 'package:coffee_shop_mobilempp/models/coffee_item.dart';
import 'package:flutter/material.dart';

import 'coffee_details_screen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final List<String> categories = [
    "All Coffee",
    "Macchiato",
    "Latte",
    "Americano",
    "Frappe",
    "smoothie"
  ];

  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(
      title: "Caffe Mocha",
      subtitle: "Deep Foam",
      price: 4.53,
      image: "assets/coffee/mocha.png",
      rating: 4.8,
      reviews: 230,
      description:
          "A smooth blend of espresso, chocolate, and steamed milk, topped with a layer of foam. Perfect for those who enjoy coffee with a hint of sweetness.",
    ),
    CoffeeItem(
      title: "Flat White",
      subtitle: "Espresso",
      price: 3.53,
      image: "assets/coffee/coffee3.png",
      rating: 4.8,
      reviews: 230,
      description:
          "An Australian classic — a double shot of espresso with velvety steamed milk, offering a strong coffee flavor balanced with creamy texture.",
    ),
    CoffeeItem(
      title: "Latte",
      subtitle: "Fresh Milk",
      price: 4.20,
      image: "assets/coffee/coffee5.png",
      rating: 4.8,
      reviews: 230,
      description:
          "A delicate combination of rich espresso and steamed milk, finished with a light layer of foam. Smooth, creamy, and perfect for a gentle coffee experience.",
    ),
    CoffeeItem(
      title: "Americano",
      subtitle: "Hot Brew",
      price: 2.99,
      image: "assets/coffee/coffee4.png",
      rating: 4.8,
      reviews: 230,
      description:
          "A simple yet bold drink made by diluting a shot of espresso with hot water, giving it a similar strength to drip coffee but with richer flavor.",
    ),
  ];

  int selectedIndex = 0; // category selected
  int selectedNavIndex = 0; // bottom nav selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ================== HEADER ==================
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF111111),
                  Color(0xFF313131),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text("Location",
                      style: TextStyle(color: Colors.grey.shade500)),
                  Row(
                    children: [
                      const Text("Bilzen, Tanjungbalai",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      const Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B2B2B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.white),
                              hintText: "Search coffee",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFFD17842),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ================== BANNER ==================
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 80, color: Colors.white),
              Positioned(
                top: -60,
                left: 16,
                right: 16,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/banner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),

          // ================== CATEGORY ==================
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xFFD17842)
                            : Colors.grey.shade200,
                        foregroundColor:
                            isSelected ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(categories[index]),
                    ),
                  );
                },
              ),
            ),
          ),

          // ================== COFFEE LIST ==================
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: coffeeItems.length,
              itemBuilder: (context, index) {
                final item = coffeeItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CoffeeDetailsScreen(item: item),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.asset(item.image,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(item.subtitle,
                                  style: const TextStyle(color: Colors.grey)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$${item.price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD17842),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(Icons.add,
                                        color: Colors.white, size: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ================== BOTTOM NAV ==================
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navButton("assets/Home.png", 0),
            _navButton("assets/heart.png", 1),
            _navButton("assets/bag.png", 2),
            _navButton("assets/bell.png", 3),
          ],
        ),
      ),
    );
  }

  // helper bottom nav
  Widget _navButton(String asset, int index) {
    bool isSelected = selectedNavIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          selectedNavIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          asset,
          color: isSelected ? const Color(0xFFD17842) : null,
        ),
      ),
    );
  }
}
