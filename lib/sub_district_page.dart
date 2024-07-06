import 'package:daftar_provinsi/sub_district_provider.dart';
import 'package:daftar_provinsi/urban_village_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'district.dart';

class SubDistrictPage extends StatelessWidget {
  const SubDistrictPage({super.key, required this.district});
  final District district;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubDistrictProvider>(
      create: (context) => SubDistrictProvider(district.id),
      child: Consumer<SubDistrictProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            title: Text(district.name),
            backgroundColor: Colors.black87,
          ),
          body: ListView.builder(
            itemCount: provider.listsubdistrict.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UrbanVillagePage(
                      subdistrict: provider.listsubdistrict.elementAt(index),
                    ),
                  ),
                );
              },
              title: Text(
                provider.listsubdistrict.elementAt(index).name,
              ),
              // subtitle: Text('id kabupaten: ${district.id}'),
              // trailing: Text('id kecamatan: ${provider.listsubdistrict.elementAt(index).id}',
              //   style: const TextStyle(color: Colors.grey)),
            ),
          ),
        ),
      ),
    );
  }
}
