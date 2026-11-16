import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profile.nama);
    _bioController = TextEditingController(text: widget.profile.bio);
    _emailController = TextEditingController(text: widget.profile.email);
    _hpController = TextEditingController(text: widget.profile.hp);
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: _namaController.text,
        nim: widget.profile.nim,
        prodi: widget.profile.prodi,
        kelas: widget.profile.kelas,
        bio: _bioController.text,
        email: _emailController.text,
        hp: _hpController.text,
        github: widget.profile.github,
      );
      Navigator.pop(context, dataBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT PROFIL"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Validasi 1: Nama wajib diisi
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama Lengkap"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama wajib diisi!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Validasi 2: Email wajib valid (@)
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return "Email tidak valid (wajib mengandung @)!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Validasi 3: Nomor HP wajib angka 10-13 digit
              TextFormField(
                controller: _hpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Nomor HP"),
                validator: (value) {
                  if (value == null || !RegExp(r'^[0-9]{10,13}$').hasMatch(value)) {
                    return "Nomor HP hanya boleh angka 10-13 digit!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: "Bio Singkat"),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _simpan,
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}