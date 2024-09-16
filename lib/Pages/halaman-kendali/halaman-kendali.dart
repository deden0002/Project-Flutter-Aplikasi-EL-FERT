import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class KendaliPage extends StatefulWidget {
  @override
  _KendaliPageState createState() => _KendaliPageState();
}

class _KendaliPageState extends State<KendaliPage> {
  double _voltage = 0.0;
  final DatabaseReference _voltageRef =
      FirebaseDatabase.instance.ref('sensorData/tegangan');
  final DatabaseReference _pwmRef =
      FirebaseDatabase.instance.ref('controlData/pwm');

  @override
  void initState() {
    super.initState();
    _voltageRef.onValue.listen((event) {
      double voltageValue = (event.snapshot.value as num).toDouble();
      setState(() {
        _voltage = voltageValue;
      });
    });
  }

  void _updateVoltageAndPwm(double voltage) {
    int pwmValue = voltageToPwm(voltage);
    _voltageRef.set(voltage);
    _pwmRef.set(pwmValue);
  }

  double pwmToVoltage(int pwm) {
    switch (pwm) {
      case 0:
        return 1;
      case 10:
        return 2;
      case 22:
        return 3;
      case 35:
        return 4;
      case 48:
        return 5;
      case 61:
        return 6;
      case 74:
        return 7;
      case 87:
        return 8;
      case 99:
        return 9;
      case 111:
        return 10;
      case 124:
        return 11;
      case 136:
        return 12;
      case 149:
        return 13;
      case 162:
        return 14;
      case 175:
        return 15;
      case 187:
        return 16;
      case 200:
        return 17;
      case 213:
        return 18;
      case 226:
        return 19;
      case 239:
        return 20;
      case 253:
        return 21;
      case 254:
        return 22;
      case 255:
        return 23;
      case 255:
        return 24;
      default:
        return 0;
    }
  }

  int voltageToPwm(double voltage) {
    int v = voltage.round();
    switch (v) {
      case 1:
        return 0;
      case 2:
        return 10;
      case 3:
        return 22;
      case 4:
        return 35;
      case 5:
        return 48;
      case 6:
        return 61;
      case 7:
        return 74;
      case 8:
        return 87;
      case 9:
        return 99;
      case 10:
        return 111;
      case 11:
        return 124;
      case 12:
        return 136;
      case 13:
        return 149;
      case 14:
        return 162;
      case 15:
        return 175;
      case 16:
        return 187;
      case 17:
        return 200;
      case 18:
        return 213;
      case 19:
        return 226;
      case 20:
        return 239;
      case 21:
        return 253;
      case 22:
        return 254;
      case 23:
        return 255;
      case 24:
        return 255;
      default:
        return 0;
    }
  }

  void _handleKeypadInput(int value) {
    double newVoltage = _voltage;

    if (value == -1) {
      // Reset tegangan ke 0 jika tombol 'C' ditekan
      newVoltage = 0.0;
    } else {
      // Tambahkan digit nilai tegangan baru
      newVoltage = newVoltage * 10 + value;
    }

    // Batasi nilai tegangan antara 0 hingga 24
    newVoltage = newVoltage.clamp(0, 24);

    setState(() {
      _voltage = newVoltage;
    });

    // Perbarui database Firebase dengan nilai tegangan baru dan PWM
    _updateVoltageAndPwm(newVoltage);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kendali Tegangan'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Atur Nilai Tegangan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Masukkan Nilai Tegangan:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${_voltage.toStringAsFixed(1)} V',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  buildNumberButton(1),
                  buildNumberButton(2),
                  buildNumberButton(3),
                  buildNumberButton(4),
                  buildNumberButton(5),
                  buildNumberButton(6),
                  buildNumberButton(7),
                  buildNumberButton(8),
                  buildNumberButton(9),
                  buildActionButton('C'),
                  buildNumberButton(0),
                  buildActionButton('C'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumberButton(int value) {
    return GestureDetector(
      onTap: () {
        _handleKeypadInput(value);
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'C') {
          _handleKeypadInput(-1);
        }
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
