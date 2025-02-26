import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  late bool isDark;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        color: isDark ? Colors.black : Color.fromARGB(255, 246, 243, 247),
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Profile heading
            Container(
              color: isDark ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            isDark ? Colors.grey[800] : Colors.black,
                        child: Text(
                          'SA',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sam',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Member Since 21 August 2024',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'General',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDark ? Colors.black : Colors.white,
              ),
              child: Column(
                children: [
                  buildMenuItem(Icons.person, 'Profile'),
                  buildMenuItem(Icons.security, 'Data & Privacy'),
                  buildMenuItem(Icons.subscriptions, 'Subscription'),
                  buildMenuItem(Icons.lock, 'Password'),
                  buildMenuItem(Icons.logout, 'Sign Out', isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, {bool isLast = false}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: isDark ? Colors.white : Colors.black,
          ),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          onTap: () {},
        ),
        if (!isLast)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: Colors.grey[800]),
          ),
      ],
    );
  }
}
