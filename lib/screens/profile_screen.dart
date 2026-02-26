import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar: back + title centered
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Spacer(),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 44),
                ],
              ),

              const SizedBox(height: 10),

              // Avatar + name + role
              Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=47",
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF4D4D),
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(
                              color: const Color(0xFFF1FBFF),
                              width: 2,
                            ),
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
                        "Chioma Okafor",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Owner",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 14),
              Divider(color: Colors.black.withOpacity(0.12), height: 1),
              const SizedBox(height: 8),

              // List items
              Expanded(
                child: ListView(
                  children: [
                    _ProfileTile(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.devices,
                      title: "My Devices",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.privacy_tip_outlined,
                      title: "Privacy Policy",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.verified_outlined,
                      title: "My warranties",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.support_agent_rounded,
                      title: "Service Request",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.smart_toy_outlined,
                      title: "SunFi Ai",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.language_rounded,
                      title: "Language",
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Icons.accessibility_new_rounded,
                      title: "Accessibility",
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),

                    // Logout (right arrow)
                    _ProfileTile(
                      icon: Icons.logout_rounded,
                      title: "Logout",
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Logged out (demo)")),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Single row widget matching your UI
class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FBFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCFE6D2)),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: Colors.black87, size: 30,),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        trailing: trailing ??
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 22,
              color: Colors.black54,
            ),
        onTap: onTap,
      ),
    );
  }
}