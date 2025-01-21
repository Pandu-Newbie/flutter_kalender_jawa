import 'package:flutter/material.dart';
import 'package:flutter_kalender_jawa/screens/welcome_screen.dart';
import 'package:flutter_kalender_jawa/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Inisialisasi date formatting lokal
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalender Jawa',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}
