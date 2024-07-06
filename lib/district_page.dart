import 'package:daftar_provinsi/district_provider.dart';
import 'package:daftar_provinsi/province.dart';
import 'package:daftar_provinsi/sub_district_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DistrictPage extends StatelessWidget {
  const DistrictPage({super.key, required this.province});
  final Province province;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DistrictProvider>(
      create: (context) => DistrictProvider(province.id),
      child: Consumer<DistrictProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            title: Text(
              province.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.black87,
          ),
          body: ListView.builder(
            itemCount: provider.listdistrict.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SubDistrictPage(
                      district: provider.listdistrict.elementAt(index),
                    ),
                  ),
                );
              },
              title: Text(
                provider.listdistrict.elementAt(index).name,
              ),
              // subtitle: Text('id provinsi: ${province.id}'),
              // trailing: Text('id kabupaten: ${provider.listdistrict.elementAt(index).id}'),
            ),
          ),
        ),
      ),
    );
  }
}
