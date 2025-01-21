class JavaneseDateConverter {
  static const List<String> bulanJawa = [
    "Sura",
    "Sapar",
    "Mulud",
    "Bakmulud",
    "Jumadilawal",
    "Jumadilakir",
    "Rejeb",
    "Ruwah",
    "Pasa",
    "Sawal",
    "Sela",
    "Besar"
  ];
  
  static const List<int> umurBulan = [
    30, 29, 30, 29, 30, 29, 30, 29, 30, 29, 30, 29
  ];
  
  static const List<int> umurTahun = [
    354, 355, 354, 355, 354, 354, 354, 355
  ];

  static Map<String, dynamic> convertToJavaneseDate(DateTime masehiDate) {
    final DateTime patokan = DateTime(1936, 3, 24); // 24 Maret 1936

    // Hitung jarak hari dari tanggal patokan
    int jarakHari = masehiDate.difference(patokan).inDays + 1;

    // Hitung jumlah windu
    int windu = jarakHari ~/ 2835;
    int sisaHari = jarakHari % 2835;

    // Hitung angka tahun Jawa
    int warsa = 0;
    while (sisaHari > umurTahun[warsa]) {
      sisaHari -= umurTahun[warsa];
      warsa++;
    }
    int tahunJawa = warsa + (windu * 8) + 1867;

    // Tentukan jumlah hari di bulan Besar
    List<int> umurBulanCopy = List.from(umurBulan);
    if (warsa == 1 || warsa == 3 || warsa == 7) {
      umurBulanCopy[11] = 30; // Tahun kabisat
    }

    // Hitung angka bulan Jawa
    int wulan = 0;
    while (sisaHari > umurBulanCopy[wulan]) {
      sisaHari -= umurBulanCopy[wulan];
      wulan++;
    }
    int tanggalJawa = sisaHari;

    return {
      "tahun": tahunJawa,
      "bulan": bulanJawa[wulan],
      "tanggal": tanggalJawa,
    };
  }
}
