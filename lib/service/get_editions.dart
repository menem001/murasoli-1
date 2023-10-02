import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/NewsModel.dart';
import '../utils/app_urls.dart';

class ApiFetcheditionLists {
  List<NewsModel>? editionList = [];
  Future<List<NewsModel>?> apiFetchedition(int srno) async {
    var ur = Uri.parse(AppUrls.getEditions + "?slno=${srno}&incidentdate=2023-09-29");
    final response2 = await http.get(ur, headers: {
      "content-type": "application/json",
    });
    print(response2.statusCode);
    switch (response2.statusCode) {
      case 200:
        editionList!.add(NewsModel.fromJson(jsonDecode(response2.body)));
        return editionList;

      default:
        return editionList;
    }
  }
}
