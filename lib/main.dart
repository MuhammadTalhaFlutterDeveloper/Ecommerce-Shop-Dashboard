import 'package:flutter/material.dart';

import 'Screens/home.dart';

void main(List<String> args) {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: "Poppins"),
      home: HomeScreen(),
    );
  }
}
