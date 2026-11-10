import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Firlo Abdul Fatur",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true),
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: MyProfilePage(),
    );
  }
}


class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Fitur Belum ada"))
            );
          },
          tooltip: "Search",
          icon: Icon(Icons.search),
          ),

          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Fitur Menu"))
            );
          },
          tooltip: "Menu",
          icon: Icon(Icons.menu),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(radius: 50,
              child: Icon(Icons.person,size: 70,),),
              SizedBox(height: 10),
              Text("Firlo Abdul Fatur",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 25
              ),
              ),
              
              Text("1124160119",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              ),

              Text("Teknik Informatika",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              ),
              
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Kontak",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                ),
              ),

              Card(child: Column(
                children: [
                  InfoTile(
                    icon : Icons.email,
                    label : "Email",
                    value : "firloabdh@gmail.com"
                  ),
                  InfoTile(
                    icon : Icons.phone,
                    label : "No.Telp",
                    value : "0895360888872"
                  ),
                  InfoTile(
                    icon : Icons.class_,
                    label : "Kelas",
                    value : "TI 24 SE 1"
                  ),
                  InfoTile(
                    icon : Icons.work,
                    label : "GitHub",
                    value : "firloabdh-dot"
                  )
                ],
              ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Hobi",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
              ),

              SizedBox(height: 20),

              Card(child: Column(
                children: [
                  InfoTile(
                    icon : Icons.book,
                    label : "Hobi",
                    value : "Baca Buku"
                  ),
                  InfoTile(
                    icon : Icons.movie,
                    label : "Hobi",
                    value : "Menonton Film"
                  ),
                  InfoTile(
                    icon : Icons.bike_scooter,
                    label : "Hobi",
                    value : "Bersepeda"
                  ),
                  
                ],
              ),
              )

            ],
          ),
        ),
        
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tambah data"))
        );
      },
      tooltip: "Tambah Data",
      child: Icon(Icons.add),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}