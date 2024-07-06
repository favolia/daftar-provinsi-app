import 'package:daftar_provinsi/province.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProvinceProvider extends ChangeNotifier {
  List<Province> listprovince = [];
  ProvinceProvider() {
    getProvince();
  }

  void getProvince() async {
    Uri uri =
        Uri.parse('http://dev.farizdotid.com/api/daerahindonesia/provinsi');

    http.Response result = await http.get(uri);
    var data = convert.jsonDecode(result.body);
    listprovince.clear();

    for (var element in data['provinsi']) {
      Province a = Province(
        name: element['nama'] ?? '',
        id: element['id'],
      );
      listprovince.add(a);
    }

    notifyListeners();
  }
}
