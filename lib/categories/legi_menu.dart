import 'package:flutter/material.dart';
import 'package:flutter_kalender_jawa/api/legi_data.dart';
import 'package:intl/intl.dart';


class LegiMenuScreen extends StatefulWidget {
  @override
  _LegiMenuScreenState createState() => _LegiMenuScreenState();
}

class _LegiMenuScreenState extends State<LegiMenuScreen> {
  DateTime? _selectedDate;
  String _informasiLegi = 'Pilih tanggal untuk melihat informasi Legi.';

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _fetchLegiData();
      });
    }
  }

  void _fetchLegiData() {
    if (_selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      // Cari data Legi berdasarkan tanggal yang dipilih
      LegiData? legi = LegiData.getLegiList().firstWhere(
        (data) => data.tanggal == formattedDate,
        orElse: () => LegiData(tanggal: formattedDate, informasi: "Tidak ada data untuk tanggal ini."),
      );
      setState(() {
        _informasiLegi = legi.informasi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pilih Tanggal untuk Informasi Legi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text('Pilih Tanggal'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Informasi Legi:\n\n$_informasiLegi',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}