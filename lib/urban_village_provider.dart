import 'package:daftar_provinsi/urban_village.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UrbanVillageProvider extends ChangeNotifier {
  List<UrbanVillage> listurbanvillage = [];
  UrbanVillageProvider(idsubdistrict) {
    getUrbanVillage(idsubdistrict);
  }

  getUrbanVillage(idsubdistrict) async {
    Uri uri = Uri.parse(
        'https://dev.farizdotid.com/api/daerahindonesia/kelurahan?id_kecamatan=$idsubdistrict');
    http.Response result = await http.get(uri);
    var data = convert.jsonDecode(result.body);

    for (var element in data['kelurahan']) {
      UrbanVillage a = UrbanVillage(
        name: element['nama'] ?? '',
        id: element['id'],
      );
      listurbanvillage.add(a);
      notifyListeners();
    }
  }
}
