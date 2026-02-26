import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  bool sheetExpanded = false;

  final options = const [
    "Vendor/Rep didn’t call back",
    "Refund request",
    "Set up shop",
    "Speak to rep",
    "Download manuals",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF),
      body: SafeArea(
        child: Stack(
          children: [
            // Background (pattern)
            Positioned.fill(
              top: 170,
              child: _PatternBackground(),
            ),

            // Header gradient
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF8E8BEF),
                    Color(0xFF3D34B8),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar: back + centered logo
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/logo.svg",
                          width: 180,
                          // if your logo is dark, keep it. If white is needed later: colorFilter.
                        ),
                        const Spacer(),
                        const SizedBox(width: 44),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Talk to us?",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Our reps. Typically reply within 20 minutes.\nIn the meantime the SunFi bot is here to assist...",
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.88),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Chat bubble (bot message)
            Positioned(
              left: 16,
              right: 16,
              top: 325,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Bot icon bubble
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6D79FF),
                      borderRadius: BorderRadius.circular(99),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.smart_toy_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 10),

                  // Message bubble
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E8FF),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.black.withOpacity(0.12)),
                      ),
                      child: const Text(
                        "Hi! How can i be of help today?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom expandable sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: _BottomOptionsSheet(
                expanded: sheetExpanded,
                options: options,
                onToggle: () => setState(() => sheetExpanded = !sheetExpanded),
                onSelect: (text) {
                  // ✅ Later: call your AI API with this as a "prompt" / "intent"
                  // For now we just show it:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $text")),
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

/// ---------------- Pattern BG ----------------
class _PatternBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simple repeated icons background (no asset needed)
    return Container(
      color: const Color(0xFFF1FBFF),
      child: Opacity(
        opacity: 0.18,
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 120,
          itemBuilder: (_, i) {
            final icons = [
              Icons.favorite_border_rounded,
              Icons.eco_outlined,
              Icons.bolt_rounded,
            ];
            return Icon(icons[i % icons.length], size: 16, color: Colors.black54);
          },
        ),
      ),
    );
  }
}

/// ---------------- Bottom Sheet ----------------
class _BottomOptionsSheet extends StatelessWidget {
  final bool expanded;
  final List<String> options;
  final VoidCallback onToggle;
  final ValueChanged<String> onSelect;

  const _BottomOptionsSheet({
    required this.expanded,
    required this.options,
    required this.onToggle,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final double height = expanded ? 360 : 70;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E8FF),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        border: Border.all(color: Colors.black.withOpacity(0.12)),
      ),
      child: Column(
        children: [
          // Header row
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Row(
                children: [
                  Icon(expanded ? Icons.close_rounded : Icons.menu_rounded),
                  const SizedBox(width: 10),
                  const Text(
                    "Select an option",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  const Spacer(),
                  Icon(expanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded),
                ],
              ),
            ),
          ),

          // Divider
          Container(height: 1, color: Colors.black.withOpacity(0.12)),

          // Options list (only show when expanded)
          if (expanded)
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (_, __) => Container(
                  height: 1,
                  color: Colors.black.withOpacity(0.12),
                ),
                itemBuilder: (context, i) {
                  final text = options[i];
                  return ListTile(
                    title: Text(
                      text,
                      style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700),
                    ),
                    onTap: () => onSelect(text),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}