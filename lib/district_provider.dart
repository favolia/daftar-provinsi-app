import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'district.dart';

class DistrictProvider extends ChangeNotifier {
  List<District> listdistrict = [];
  DistrictProvider(idprovince) {
    getDistrict(idprovince);
  }

  void getDistrict(idprovince) async {
    Uri uri = Uri.parse(
        'https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=$idprovince');
    http.Response result = await http.get(uri);
    var data = convert.jsonDecode(result.body);
    listdistrict.clear();

    for (var element in data['kota_kabupaten']) {
      District a = District(
        name: element['nama'] ?? '',
        id: element['id'] ?? '',
      );
      listdistrict.add(a);
    }

    notifyListeners();
  }
}
