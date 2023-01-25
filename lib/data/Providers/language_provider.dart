import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/language.dart';

class LanguageApi {
  final String _languagesUrl = "/brands/";

  // Get All Languages
  Future<List<Language>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _languagesUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Language> languages = results.map(
        (dynamic brand) {
          return Language.fromMap(brand);
        },
      ).toList();

      return languages;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Language
  Future<Language> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_languagesUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Language language = Language.fromJson(res.body);

      return language;
    } else {
      throw "Unable to retrieve departments.";
    }
  }
}
