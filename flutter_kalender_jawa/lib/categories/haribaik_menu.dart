// categories/haribaik_menu.dart
import 'package:flutter/material.dart';

class HariBaikMenuScreen extends StatelessWidget {
  const HariBaikMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hari Baik Menu"),
      ),
      body: Center(
        child: Text("Details about Hari Baik"),
      ),
    );
  }
}
