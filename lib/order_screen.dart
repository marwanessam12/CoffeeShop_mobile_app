import 'package:coffee_shop_mobilempp/order_success_screen.dart';
import 'package:flutter/material.dart';

import 'models/coffee_item.dart';

class OrderScreen extends StatefulWidget {
  final CoffeeItem item;

  const OrderScreen({super.key, required this.item});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int quantity = 1;
  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    double deliveryFee = isDelivery ? 1.0 : 0.0;
    double total = (widget.item.price * quantity) + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Order",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery / Pickup toggle
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isDelivery ? const Color(0xFFD17842) : Colors.grey,
                    ),
                    onPressed: () => setState(() => isDelivery = true),
                    child: const Text("Deliver",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !isDelivery ? const Color(0xFFD17842) : Colors.grey,
                    ),
                    onPressed: () => setState(() => isDelivery = false),
                    child: const Text("Pick Up",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Address
            const Text("Delivery Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("Jl. Kpg Sutoyo",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai."),
            const SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {}, child: const Text("Edit Address")),
                const SizedBox(width: 8),
                OutlinedButton(onPressed: () {}, child: const Text("Add Note")),
              ],
            ),
            const SizedBox(height: 20),

            // Coffee item
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.item.image,
                      width: 60, height: 60, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(widget.item.subtitle,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                ),
                Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() => quantity++);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Discount row
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.local_offer, color: Color(0xFFD17842)),
              title: const Text("1 Discount is Applies"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            const Divider(),

            // Payment Summary
            const Text("Payment Summary",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Price"),
                Text("\$${(widget.item.price * quantity).toStringAsFixed(2)}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery Fee"),
                Text("\$${deliveryFee.toStringAsFixed(2)}"),
              ],
            ),
            const Spacer(),

            // Order button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD17842),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderSuccessScreen()),
                );
              },
              child: Text("Order  \$${total.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
