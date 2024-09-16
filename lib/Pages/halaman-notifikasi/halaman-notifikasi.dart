import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final DatabaseReference _database =
      FirebaseDatabase.instance.reference().child('sensorData');

  String tegangan = '';
  String continuousDuration = '';

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    // Initialisasi pengaturan notifikasi
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onSelectNotification);

    // Mendengarkan perubahan pada Firebase dan memperbarui state
    _database.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        tegangan = data['tegangan'].toString();
        continuousDuration = data['continuousDuration'].toString();
        // Menampilkan notifikasi di status bar perangkat
        _showNotification('Notifikasi Alat Aktif',
            'Alat berhasil diaktifkan dengan tegangan sebesar $tegangan V');
        _showNotification(
            'Notifikasi Durasi', 'Alat telah aktif selama $continuousDuration');
      });
    });
  }

  Future<void> onSelectNotification(NotificationResponse response) async {
    // Metode ini akan dipanggil saat pengguna mengklik notifikasi
    print('Notification clicked');
  }

  // Metode untuk menampilkan notifikasi di status bar perangkat
  Future<void> _showNotification(String title, String message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      channelDescription: 'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text('Notifikasi'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/halaman-notifikasi/images/rectangle-19-yvu.png',
              width: 120,
              height: 100,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: [
                  NotificationCard(
                    title: 'Notifikasi Alat Aktif',
                    message:
                        'Alat berhasil diaktifkan dengan tegangan sebesar $tegangan V',
                  ),
                  SizedBox(height: 20.0),
                  NotificationCard(
                    title: 'Notifikasi Durasi',
                    message: 'Alat telah aktif selama $continuousDuration',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;

  const NotificationCard({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
