import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HariBaikMenuScreen extends StatefulWidget {
  const HariBaikMenuScreen({super.key});

  @override
  _HariBaikMenuScreenState createState() => _HariBaikMenuScreenState();
}

class _HariBaikMenuScreenState extends State<HariBaikMenuScreen> {
  DateTime? _selectedDate;
  String _selectedHari = 'Senin';
  String _selectedPasaran = 'Legi';
  String _informasiHariBaik = 'Pilih data untuk melihat informasi Hari Baik.';

  static const Map<String, int> neptuHari = {
    "Senin": 5,
    "Selasa": 4,
    "Rabu": 7,
    "Kamis": 8,
    "Jumat": 6,
    "Sabtu": 9,
    "Minggu": 5,
  };

  static const Map<String, int> neptuPasaran = {
    "Legi": 5,
    "Pahing": 9,
    "Pon": 7,
    "Wage": 9,
    "Kliwon": 4,
  };

  static const Map<int, String> tingkatKeberuntungan = {
    1: "Sri (Berlimpah rezeki)",
    2: "Lungguh (Dihormati, disegani)",
    3: "Gedhong (Berlimpah kekayaan)",
    4: "Lara (Kesialan, penyakit)",
    5: "Pati (Kematian, musibah)",
    0: "Hari biasa (Netral)"
  };

  void _fetchHariBaikData() {
    int neptuHariValue = neptuHari[_selectedHari] ?? 0;
    int neptuPasaranValue = neptuPasaran[_selectedPasaran] ?? 0;

    int totalNeptu = neptuHariValue + neptuPasaranValue;
    int sisa = totalNeptu % 7;

    setState(() {
      _informasiHariBaik = tingkatKeberuntungan[sisa] ??
          "Tidak ada informasi untuk kombinasi ini.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hari Baik')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Form untuk memilih tanggal
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Text('Pilih Tanggal'),
            ),
            const SizedBox(height: 10),
            Text(
              _selectedDate == null
                  ? 'Tanggal belum dipilih'
                  : 'Tanggal dipilih: ${DateFormat('dd MMMM yyyy').format(_selectedDate!)}',
            ),
            const SizedBox(height: 20),

            // Dropdown untuk memilih hari
            DropdownButton<String>(
              value: _selectedHari,
              items: neptuHari.keys
                  .map((hari) => DropdownMenuItem(
                        value: hari,
                        child: Text(hari),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedHari = value ?? 'Senin';
                });
              },
            ),

            // Dropdown untuk memilih pasaran
            DropdownButton<String>(
              value: _selectedPasaran,
              items: neptuPasaran.keys
                  .map((pasaran) => DropdownMenuItem(
                        value: pasaran,
                        child: Text(pasaran),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPasaran = value ?? 'Legi';
                });
              },
            ),
            const SizedBox(height: 20),

            // Tombol untuk menghitung informasi hari baik
            ElevatedButton(
              onPressed: _fetchHariBaikData,
              child: Text('Hitung Hari Baik'),
            ),
            const SizedBox(height: 20),

            // Output informasi hari baik
            Text(
              _informasiHariBaik,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}