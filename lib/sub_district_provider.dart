import 'package:daftar_provinsi/sub_district.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SubDistrictProvider extends ChangeNotifier {
  List<SubDistrict> listsubdistrict = [];
  SubDistrictProvider(iddistrict) {
    getSubDistrict(iddistrict);
  }

  void getSubDistrict(iddistrict) async {
    Uri uri = Uri.parse(
        'https://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=$iddistrict');
    http.Response result = await http.get(uri);
    var data = convert.jsonDecode(result.body);
    listsubdistrict.clear();

    for (var element in data['kecamatan']) {
      SubDistrict a = SubDistrict(
        name: element['nama'] ?? '',
        id: element['id'],
      );
      listsubdistrict.add(a);
      notifyListeners();
    }
  }
}
