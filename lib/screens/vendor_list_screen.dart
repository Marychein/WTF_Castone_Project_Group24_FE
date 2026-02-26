import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorListScreen extends StatefulWidget {
  const VendorListScreen({super.key});

  @override
  State<VendorListScreen> createState() => _VendorListScreenState();
}

class _VendorListScreenState extends State<VendorListScreen> {
  final searchC = TextEditingController();
  int selectedCategory = 0;

  final categories = const [
    "All Vendors",
    "Solar Panels",
    "Inverters",
    "Batteries",
  ];

  final List<_Vendor> vendors = [
    _Vendor(
      name: "Amara Okafor",
      regNumber: "236518",
      specialty: "Urban residential solar kits",
      region: "Algeria",
      rating: 4.5,
      imageUrl: "https://i.pravatar.cc/150?img=47",
      primaryAction: "See Shop",
    ),
    _Vendor(
      name: "Kofi Mensah",
      regNumber: "236518",
      specialty: "Service Technician",
      region: "Tunisia",
      rating: 4.5,
      imageUrl: "https://i.pravatar.cc/150?img=12",
      primaryAction: "Reviews",
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
              // Top bar: back + centered logo
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/logo.svg', width: 150),
                  const Spacer(),
                  const SizedBox(width: 44),
                ],
              ),

              const SizedBox(height: 10),

              // Search bar
              _SearchBar(
                controller: searchC,
                hint: "Find Vendor",
                onChanged: (v) {},
                onSearch: () {},
              ),

              const SizedBox(height: 32),

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

              const SizedBox(height: 32),

              // ✅ VERTICAL LISTVIEW
              Expanded(
                child: ListView.separated(
                  itemCount: vendors.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, i) {
                    return _VendorCard(
                      vendor: vendors[i],
                      onLike: () =>
                          setState(() => vendors[i].liked = !vendors[i].liked),
                      onSave: () =>
                          setState(() => vendors[i].saved = !vendors[i].saved),
                      onContacts: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("See Contacts")),
                        );
                      },
                      onPrimary: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(vendors[i].primaryAction)),
                        );
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

/// ---------------- UI WIDGETS ----------------

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
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _VendorCard extends StatelessWidget {
  final _Vendor vendor;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onContacts;
  final VoidCallback onPrimary;

  const _VendorCard({
    required this.vendor,
    required this.onLike,
    required this.onSave,
    required this.onContacts,
    required this.onPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FBFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFF559326)),
      ),
      child: Column(
        children: [
          // Inner white card
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF18144F),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black.withOpacity(0.10)),
            ),
            child: Row(
              children: [
                // Photo
                Container(
                  width: 98,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFF22246A),
                    image: DecorationImage(
                      image: NetworkImage(vendor.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Info
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0xFFF1FBFF),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vendor Name: ${vendor.name}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Vendor Registration Number: ${vendor.regNumber}",
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Specialist: ${vendor.specialty}",
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Region: ${vendor.region}",
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.80),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // rating + actions row
                        Row(
                          children: [
                            Text(
                              "Vendor rating (${vendor.rating})",
                              style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.star_rounded, size: 14),
                            const Spacer(),

                            IconButton(
                              onPressed: onLike,
                              visualDensity: VisualDensity.compact,
                              icon: Icon(
                                vendor.liked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: onSave,
                              visualDensity: VisualDensity.compact,
                              icon: Icon(
                                vendor.saved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Bottom buttons
          Row(
            children: [
              Expanded(
                child: _SmallActionButton(
                  text: "See Contacts", 
                  icon: Icons.perm_contact_calendar_rounded,
                  onTap: onContacts,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _PrimaryActionButton(
                  text: vendor.primaryAction,
                  icon: Icons.storefront_rounded,
                  onTap: onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _SmallActionButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.45),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryActionButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Color(0xFF559326),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- MODEL ----------------

class _Vendor {
  final String name;
  final String regNumber;
  final String specialty;
  final String region;
  final double rating;
  final String imageUrl;
  final String primaryAction;

  bool liked;
  bool saved;

  _Vendor({
    required this.name,
    required this.regNumber,
    required this.specialty,
    required this.region,
    required this.rating,
    required this.imageUrl,
    required this.primaryAction,
    this.liked = false,
    this.saved = false,
  });
}
