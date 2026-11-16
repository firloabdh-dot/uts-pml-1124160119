import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TENTANG SAYA"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text(
            "Keahlian & Hobi",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                InfoTile(icon: Icons.flutter_dash, label: "Keahlian", value: "Flutter & Java"),
                InfoTile(icon: Icons.motorcycle, label: "Hobi", value: "Riding Motor & Musik"),
                InfoTile(icon: Icons.games, label: "Game", value: "Mobile Legends"),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Riwayat Pendidikan",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                InfoTile(
                  icon: Icons.school,
                  label: "Kampus",
                  value: "Global Institute - Teknik Informatika",
                ),
                InfoTile(
                  icon: Icons.calendar_today,
                  label: "Angkatan",
                  value: "2024 - Sekarang",
                ),
              ],
            ),
          ),
        ],
      ),
      
      //NAVIGASI BAWAH PROFILE PAGE
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (int index) {
          if (index == 0) { 
            Navigator.pop(context);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline), 
            selectedIcon: Icon(Icons.person), 
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}