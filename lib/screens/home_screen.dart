import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/javanese_date_converter.dart';

// Import the category screens
import 'package:flutter_kalender_jawa/categories/haribaik_menu.dart';
import 'package:flutter_kalender_jawa/categories/legi_menu.dart';
import 'package:flutter_kalender_jawa/categories/pon_menu.dart';
import 'package:flutter_kalender_jawa/categories/weton_menu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<Map<String, String>> _getTodayInfo() async {
  DateTime today = DateTime.now();
  String formattedDate = DateFormat('EEEE', 'id').format(today);
  Map<String, String> todayInfo = await JavaneseDateConverter.convertToJavaneseDate(today);
  todayInfo['formattedDate'] = formattedDate;
  return todayInfo;
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hi, Pengguna',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Anda memiliki 4 hari penting dalam Kalender Jawa minggu ini',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder<Map<String, String>>(
                          future: _getTodayInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(
                                      'Terjadi kesalahan. Coba lagi nanti.'));
                            } else {
                              // Data berhasil dimuat
                              var todayInfo = snapshot.data!;
                              return Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade800,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Informasi Hari Ini',
                                      style: TextStyle(
                                        fontSize: 36,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Hari ini adalah ${todayInfo['formattedDate']} ${todayInfo['pasaran']}, ${todayInfo['tanggal']} ${todayInfo['bulan']} ${todayInfo['tahun']}.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Tampilkan detail lainnya
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        'Lihat detail',
                                        style: TextStyle(
                                          color: Colors.blue.shade800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Subjek',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 10,
                          children: [
                            _buildSubjectChip('Primbon', Colors.blue),
                            _buildSubjectChip('Weton', Colors.red),
                            _buildSubjectChip('Pasaran', Colors.orange),
                            _buildSubjectChip('Hari Baik', Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(BuildContext context, String title, String subtitle, String timeLeft, Color color) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding screen based on the tapped card
        switch (title) {
          case 'Legi':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LegiMenuScreen()),
            );
            break;
          case 'Hari Baik':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HariBaikMenuScreen()),
            );
            break;
          case 'Pon':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PonMenuScreen()),
            );
            break;
          case 'Weton':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WetonMenuScreen()),
            );
            break;
        }
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: color),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  timeLeft,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectChip(String label, Color color) {
    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: TextStyle(color: color),
    );
  }
}
