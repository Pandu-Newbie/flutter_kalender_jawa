class LegiData {
  final String tanggal;
  final String informasi;

  LegiData({required this.tanggal, required this.informasi});

  static List<LegiData> getLegiList() {
    return [
      LegiData(tanggal: "2024-12-12", informasi: "Hari Legi: Hari baik untuk memulai bisnis kecil."),
      LegiData(tanggal: "2024-12-06", informasi: "Hari Legi: Hari baik untuk pertemuan keluarga."),
      LegiData(tanggal: "2024-12-07", informasi: "Hari Legi: Tidak disarankan untuk memulai perjalanan."),
      LegiData(tanggal: "2024-12-08", informasi: "Hari Legi: Hari baik untuk menanam."),
    ];
  }
}