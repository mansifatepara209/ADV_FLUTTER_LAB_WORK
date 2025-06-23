import 'package:flutter/material.dart';
import 'flipcart_controller.dart';


class FlipcartView extends StatelessWidget {
  final controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    final categories = controller.getCategories();
    final products = controller.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flipcart Dashboard"),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Category icons
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Text(category.icon ?? "❓", style: TextStyle(fontSize: 22)),
                          ),
                          SizedBox(height: 4),
                          Text(category.name, style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),

                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(product.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("\$${product.price?.toStringAsFixed(2) ?? '--'}", style: TextStyle(color: Colors.green)),
                        ),
                        Spacer(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Buy"),
                            style: ElevatedButton.styleFrom(minimumSize: Size(100, 36)),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
