// app_modules/medicalShop_section.dart/views/medical_shop.dart
import 'package:flutter/material.dart';

class MedicalShop extends StatelessWidget {
  const MedicalShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
    );
  }
}
