import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class GrafikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[200],
        elevation: 0,
        title: Text('Grafik Pembacaan Sensor'),
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
          padding: const EdgeInsets.all(8.0), // Reduced padding
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildChart(
                    'Tinggi Tanaman (cm)', 'height', Colors.blue, history),
                SizedBox(height: 16), // Reduced spacing
                _buildChart('Arus (mA)', 'current', Colors.red, history),
                SizedBox(height: 16), // Reduced spacing
                _buildChart('Tegangan (V)', 'tegangan', Colors.orange, history),
                SizedBox(height: 16), // Reduced spacing
                _buildChart('Kelembaban Tanah (%)', 'moistureLevel',
                    Colors.green, history),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart(String title, String key, Color color,
      List<Map<String, dynamic>> history) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 300, // Increased height for the graph area
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: history
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), e.value[key] ?? 0.0))
                      .toList(),
                  isCurved: true,
                  barWidth: 2,
                  color: color,
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toString());
                    },
                    reservedSize: 28,
                  ),
                  axisNameWidget: Text('Nilai Pembacaan Sensor'),
                  axisNameSize: 16,
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString());
                    },
                    reservedSize: 28,
                  ),
                  axisNameWidget: Text('Data Ke-'),
                  axisNameSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}