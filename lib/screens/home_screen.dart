import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF), // light background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Logo + Bell
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 120,
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

              const SizedBox(height: 15),

              // Greeting row: avatar + text
              Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=47', // placeholder
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 7, 194, 85),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(color: const Color(0xFFF1FBFF), width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Chioma",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 38),

              // "Let's have a Green Day..." + leaf icon
              Row(
                children: [
                  SizedBox(width: 30,),
                  const Text(
                    "Let’s have a Green Day...",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Icon(Icons.eco, color: Color(0xFF3E7C1E), size: 30),
                ],
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.black.withOpacity(0.12), height: 1),

              const SizedBox(height: 25),

              // Cards row: Production big card + small system card
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _ProductionCard(
                      productionKwh: "12.5 kWH",
                      savings: "5%",
                      onTap: () {
                        // TODO: open details
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: _SystemAlertCard(
                      title: "System",
                      subtitle: "Your product is\nfor a sunny\nday",
                      cta: "Troubleshoot",
                      onTap: () {
                        // TODO: troubleshoot
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Search bar
              _SearchBar(
                hint: "Find device",
                onChanged: (v) {},
                onSearch: () {},
              ),

              const SizedBox(height: 24),

              // Device cards row
              Row(
                children: [
                  Expanded(
                    child: _DeviceCard(
                      percent: "20%",
                      label: "Kitchen",
                      icon: Icons.kitchen_outlined,
                      background: const Color(0xFFFFF2A8),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _DeviceCard(
                      percent: "16%",
                      label: "Office",
                      icon: Icons.chair_alt_outlined,
                      background: const Color(0xFFFFF9D8),
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- WIDGETS ----------------

class _ProductionCard extends StatelessWidget {
  final String productionKwh;
  final String savings;
  final VoidCallback onTap;

  const _ProductionCard({
    required this.productionKwh,
    required this.savings,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFCFFEBB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              "Today’s Production:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, fontFamily: 'Lufga',
),
            ),
            const SizedBox(height: 10),
            Text(
              productionKwh,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
 ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.bolt_rounded, size: 14),
                ),
                const SizedBox(width: 8),
                Text(
                  "Predicted Energy Savings: $savings",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SystemAlertCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cta;
  final VoidCallback onTap;

  const _SystemAlertCard({
    required this.title,
    required this.subtitle,
    required this.cta,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFF9B8F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              cta,
              style: const TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onSearch;

  const _SearchBar({
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
        border: Border.all(color: Colors.black.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.35), fontSize: 12.5),
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

class _DeviceCard extends StatelessWidget {
  final String percent;
  final String label;
  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  const _DeviceCard({
    required this.percent,
    required this.label,
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 92,
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  percent,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                Icon(Icons.power_settings_new_rounded, size: 16, color: Colors.black54),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(icon, size: 16),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}