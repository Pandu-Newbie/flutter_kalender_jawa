// categories/primbon_menu.dart
import 'package:flutter/material.dart';

class PonMenuScreen extends StatelessWidget {
  const PonMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pon Menu"),
      ),
      body: Center(
        child: Text("Details about Primbon"),
      ),
    );
  }
}
