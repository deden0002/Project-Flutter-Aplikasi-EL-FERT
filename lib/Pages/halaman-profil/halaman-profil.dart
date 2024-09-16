import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/name_routes.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text('Halaman Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Profil Anggota'),
              ProfileMember(
                name: 'Denia Aldi Saputra',
                nim: '120130001',
                imageUrl: 'assets/halaman-profil/images/denia.png',
              ),
              ProfileMember(
                name: 'I Wayan Eka Raditya',
                nim: '120130019',
                imageUrl: 'assets/halaman-profil/images/wayan.jpg',
              ),
              ProfileMember(
                name: 'Ismi Azizah Umar',
                nim: '120130012',
                imageUrl: 'assets/halaman-profil/images/ismi.jpg',
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'Dosen Pembimbing 1'),
              ProfileAdvisor(
                name: 'Tria Kasnalestari, S.T., M.T.',
                nip: '1992 0917 202203 2 012',
              ),
              SizedBox(height: 20),
              SectionTitle(title: 'Dosen Pembimbing 2'),
              ProfileAdvisor(
                name: 'Muhammad Asrofi, S.T., M.Eng',
                nip: '1993 1216 202203 1 005',
              ),
              SizedBox(height: 20),
              ProfileChangePassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

class ProfileMember extends StatelessWidget {
  final String name;
  final String nim;
  final String imageUrl;

  ProfileMember(
      {required this.name, required this.nim, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'NIM: $nim',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileAdvisor extends StatelessWidget {
  final String name;
  final String nip;

  ProfileAdvisor({required this.name, required this.nip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NIP: $nip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        leading: Icon(Icons.lock, color: Colors.grey),
        title: Text(
          'Ganti Kata Sandi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Get.toNamed(RouteName.changePassword);
        },
      ),
    );
  }
}
