import 'package:flutter/material.dart';
// import 'package:phuong_trinh_flutter/pages/home_page.dart';
import 'package:phuong_trinh_flutter/pages/home_page_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Buoi_1_Flutter",
      theme: ThemeData(useMaterial3: true),
      home: const HomePage2(title: "Phương Trình Bậc 2"),
    );
  }
}
