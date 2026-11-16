import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile dataProfil = Profile(
    nama: "Firlo Abdul Fatur",
    nim: "1124160119",
    prodi: "Teknik Informatika",
    kelas: "TI 24 SE 1",
    bio: "Mahasiswa Teknik Informatika Global Institute.",
    email: "firlo@global.ac.id",
    hp: "081234567890",
    github: "github.com/firloabdh-dot",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: widget.onThemeChanged,
            tooltip: "Mode Gelap/Terang",
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              // Nanti disambungkan ke EditProfilePage di Commit 10
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Membuka halaman edit...")),
              );
            },
            tooltip: "Edit Profil",
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu Aplikasi",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profil"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Tentang Saya"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  // SUDAH PAKAI FOTO DARI ASSETS
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/WhatsApp Image 2026-11-15 at 13.07.32.jpeg'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    dataProfil.nama,
                    style: const TextStyle(
                      fontFamily: "serif",
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text("${dataProfil.nim} - ${dataProfil.prodi}"),
                  Text("Kelas: ${dataProfil.kelas}"),
                  const SizedBox(height: 8),
                  Text(dataProfil.bio, textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  Card(
                    child: Column(
                      children: [
                        InfoTile(icon: Icons.email, label: "Email", value: dataProfil.email),
                        InfoTile(icon: Icons.phone, label: "Nomor HP", value: dataProfil.hp),
                        InfoTile(icon: Icons.code, label: "GitHub", value: dataProfil.github),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Terima kasih telah melihat profil saya")),
          );
        },
        tooltip: "Tambah",
        child: const Icon(Icons.add),
      ),
    );
  }
}