// categories/weton_menu.dart
import 'package:flutter/material.dart';

class WetonMenuScreen extends StatelessWidget {
  const WetonMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weton Menu"),
      ),
      body: Center(
        child: Text("Details about Weton"),
      ),
    );
  }
}
