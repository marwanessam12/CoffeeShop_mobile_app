import 'package:flutter/material.dart';

import 'models/coffee_item.dart';
import 'order_screen.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final CoffeeItem item;

  const CoffeeDetailsScreen({super.key, required this.item});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  String selectedSize = "M";

  double getPrice() {
    double basePrice = widget.item.price;
    switch (selectedSize) {
      case "S":
        return basePrice;
      case "M":
        return basePrice + 2;
      case "L":
        return basePrice + 4;
      default:
        return basePrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(widget.item.image,
                    width: double.infinity, height: 250, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(widget.item.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              Text(widget.item.subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 30),
                  const SizedBox(width: 4),
                  Text("${widget.item.rating} (${widget.item.reviews})",
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 16),
              const Text("Description",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(
                widget.item.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Text("Size",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: ["S", "M", "L"].map((size) {
                  final isSelected = selectedSize == size;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => selectedSize = size);
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFD17842)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFD17842)
                                  : Colors.grey.shade400,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Price"),
                Text("\$${getPrice().toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFD17842),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD17842),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderScreen(item: widget.item),
                  ),
                );
              },
              child: const Text("Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
