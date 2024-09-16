import 'package:flutter/material.dart';

class AboutDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text(
          'About Device',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Electric Fertilizer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'DC Voltage Based Plant Growth Stimulator',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Alat ini merupakan sebuah stimulator pertumbuhan tanaman yang berbasis tegangan DC. '
                'Stimulator ini dirancang untuk meningkatkan pertumbuhan tanaman dengan cara yang lebih efisien dan efektif. '
                'Dengan menggunakan teknologi tegangan DC, alat ini dapat memberikan dosis listrik yang tepat untuk merangsang pertumbuhan tanaman secara optimal. '
                'Selain itu, produk ini juga dilengkapi dengan sistem penyiraman otomatis menggunakan sensor kelembapan yang menjaga kelembaban tanah dan mengurai unsur hara menjadi ion, '
                'yang semakin meningkatkan efisiensi pertumbuhan tanaman.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Spesifikasi Alat:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Nama Alat'),
                subtitle: Text('Electric Fertilizer'),
              ),
              ListTile(
                title: Text('Model Alat'),
                subtitle: Text('TA2324.01.002'),
              ),
              ListTile(
                title: Text('Sistem Operasi'),
                subtitle: Text('Berbasis Tegangan DC'),
              ),
              ListTile(
                title: Text('Versi Alat'),
                subtitle: Text('1.0.0'),
              ),
              Divider(),
              Text(
                'Informasi Aplikasi:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Nama Aplikasi'),
                subtitle: Text('EL-FERT APP'),
              ),
              ListTile(
                title: Text('Versi Aplikasi'),
                subtitle: Text('1.0.0'),
              ),
              ListTile(
                title: Text('Penerbit Aplikasi'),
                subtitle: Text('TIM EL-FERT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
