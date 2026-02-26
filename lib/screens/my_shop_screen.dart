import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyShopScreen extends StatefulWidget {
  const MyShopScreen({super.key});

  @override
  State<MyShopScreen> createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  int selectedCategory = 0;
  final searchC = TextEditingController();

  final categories = const [
    "All Products",
    "Inverters",
    "Panels",
    "Batteries",
  ];

  final List<_Product> products = [
    _Product(
      title: "Solar Panel",
      description:
          "SunFi Solar 565 Watts\nMonocrystalline Solar Panel | Bifacial",
      price: 450.00,
      imagePath: "assets/solar.png", // replace with real product image
    ),
    _Product(
      title: "Solar Inverter",
      description:
          "Low Frequency Off Grid Solar\nInverter 1-6KW | AC 120V |\nMPPT 80A | PV 245V",
      price: 320.00,
      imagePath: "assets/vendor.png", // replace with real product image
    ),
  ];

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: Column(
            children: [
              // Top centered logo
              Center(
                child: SvgPicture.asset(
                  "assets/logo.svg",
                  width: 130,
                ),
              ),

              const SizedBox(height: 10),

              // Back + title + bell row
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Spacer(),
                  const Text(
                    "My Shop",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Lufga",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // TODO: notifications
                    },
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Search bar
              _SearchBar(
                controller: searchC,
                hint: "Search for product",
                onChanged: (v) {
                  // optional: filter products
                },
                onSearch: () {},
              ),

              const SizedBox(height: 22),

              // Categories chips
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final isSelected = i == selectedCategory;
                    return _CategoryChip(
                      text: categories[i],
                      selected: isSelected,
                      onTap: () => setState(() => selectedCategory = i),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              // Product list
              Expanded(
                child: ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    return _ProductCard(
                      product: products[i],
                      onToggle: (v) {
                        setState(() => products[i].selected = v);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- Widgets ----------------

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onSearch;

  const _SearchBar({
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.35),
                  fontSize: 12.5,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSearch,
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2E2BB3) : const Color(0xFFE9ECF7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF2E2BB3) : Colors.black12,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final _Product product;
  final ValueChanged<bool> onToggle;

  const _ProductCard({
    required this.product,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 239, 235),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(

            width: 84,
            height: 154,
            decoration: BoxDecoration(
                          color:    const Color(0xFFF7F3DA),

              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withOpacity(0.12)),
              image: DecorationImage(
                image: AssetImage(product.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: product.selected,
                      onChanged: onToggle,
                      activeColor: const Color(0xFF3E7C1E),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.35,
                    color: Colors.black.withOpacity(0.70),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "\$ ${product.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- Model ----------------

class _Product {
  final String title;
  final String description;
  final double price;
  final String imagePath;
  bool selected;

  _Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    this.selected = false,
  });
}