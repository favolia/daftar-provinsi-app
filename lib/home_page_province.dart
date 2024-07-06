import 'package:daftar_provinsi/district_page.dart';
import 'package:daftar_provinsi/province_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageProvince extends StatelessWidget {
  const HomePageProvince({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProvinceProvider>(
      create: (context) => ProvinceProvider(),
      child: Consumer<ProvinceProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Daftar Provinsi',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.black87,
          ),
          body: ListView.builder(
            itemCount: provider.listprovince.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DistrictPage(
                      province: provider.listprovince.elementAt(index),
                    ),
                  ),
                );
              },
              title: Text(provider.listprovince.elementAt(index).name),
              // subtitle: Text('id provinsi: ${provider.listprovince.elementAt(index).id}'),
            ),
          ),
        ),
      ),
    );
  }
}
