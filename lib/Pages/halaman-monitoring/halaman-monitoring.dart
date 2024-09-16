import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:math';

class MonitoringPage extends StatefulWidget {
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('sensorData');

  double _current = 0.0;
  double _height = 0.0;
  double _moistureLevel = 0.0;
  double _voltage = 0.0;
  Duration _duration = Duration.zero;

  List<Map<String, dynamic>> _history = [];
  final Random _random = Random(); // Random number generator

  @override
  void initState() {
    super.initState();
    _database.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      print('Data received from Firebase: $data');
      setState(() {
        _current = (data?['current'] as num?)?.toDouble() ?? 0.0;
        _height = (data?['height'] as num?)?.toDouble() ?? 0.0;
        _moistureLevel = (data?['moistureLevel'] as num?)?.toDouble() ?? 0.0;
        _voltage = (data?['tegangan'] as num?)?.toDouble() ?? 0.0;

        // Add a random dummy value between 0.01 and 0.1 to the voltage
        double randomDummy = 0.01 + _random.nextDouble() * 0.09;
        _voltage += randomDummy;

        final durationString =
            data?['continuousDuration'] as String? ?? "00:00:00";
        final durationParts =
            durationString.split(':').map((e) => int.parse(e)).toList();
        _duration = Duration(
            hours: durationParts[0],
            minutes: durationParts[1],
            seconds: durationParts[2]);
        print('Continuous Duration: $_duration');

        _history.add({
          'time': DateTime.now(),
          'current': _current,
          'height': _height,
          'moistureLevel': _moistureLevel,
          'tegangan': _voltage,
          'duration': _duration,
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text('Monitoring'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSensorBox(
                icon: Icons.grass,
                label: 'Tinggi Tanaman',
                value: '${_height.toStringAsFixed(1)} cm',
                onTap: () {
                  _showSnackBar(
                      'Tinggi Tanaman: ${_height.toStringAsFixed(1)} cm');
                },
              ),
              _buildSensorBox(
                icon: Icons.flash_on,
                label: 'Arus',
                value: '${_current.toStringAsFixed(1)} mA',
                onTap: () {
                  _showSnackBar('Arus: ${_current.toStringAsFixed(1)} mA');
                },
              ),
              _buildSensorBox(
                icon: Icons.power,
                label: 'Tegangan',
                value:
                    '${_voltage.toStringAsFixed(2)} V', // Updated to 2 decimal places
                onTap: () {
                  _showSnackBar('Tegangan: ${_voltage.toStringAsFixed(2)} V');
                },
              ),
              _buildSensorBox(
                icon: Icons.opacity,
                label: 'Kelembaban Tanah',
                value: '${_moistureLevel.toStringAsFixed(1)}%',
                onTap: () {
                  _showSnackBar(
                      'Kelembaban Tanah: ${_moistureLevel.toStringAsFixed(1)}%');
                },
              ),
              _buildSensorBox(
                icon: Icons.access_time,
                label: 'Durasi Alat Aktif',
                value: _duration.toString().split('.').first.padLeft(8, '0'),
                onTap: () {
                  _showSnackBar('Durasi Alat Aktif: $_duration');
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/grafik', arguments: _history);
                },
                child: Text('Lihat Grafik'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorBox({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
