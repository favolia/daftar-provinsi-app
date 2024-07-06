import 'package:daftar_provinsi/home_page_province.dart';
import 'package:flutter/material.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Daftar Provinsi',
      debugShowCheckedModeBanner: false,
      home: HomePageProvince(),
    );
  }
}
