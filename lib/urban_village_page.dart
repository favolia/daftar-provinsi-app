import 'package:daftar_provinsi/sub_district.dart';
import 'package:daftar_provinsi/urban_village_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UrbanVillagePage extends StatelessWidget {
  const UrbanVillagePage({super.key, required this.subdistrict});
  final SubDistrict subdistrict;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UrbanVillageProvider>(
      create: (context) => UrbanVillageProvider(subdistrict.id),
      child: Consumer<UrbanVillageProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            title: Text(subdistrict.name),
            backgroundColor: Colors.black87,
          ),
          body: ListView.builder(
            itemCount: provider.listurbanvillage.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                provider.listurbanvillage.elementAt(index).name,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
