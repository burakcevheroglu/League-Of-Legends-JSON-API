import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lol_api/champions.dart';

 List<Champion> champs = [];

 Future<List<Champion>> makeCall() async {
  String jsonLink =
      'http://ddragon.leagueoflegends.com/cdn/13.1.1/data/en_US/champion.json';
  final response = await http.get(Uri.parse(jsonLink));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData['data'].forEach((key, value) {

        Champion champion = Champion(
            version: jsonData['data'][key]['version'],
            id: jsonData['data'][key]['id'],
            key: jsonData['data'][key]['key'],
            name: jsonData['data'][key]['name'],
            title: jsonData['data'][key]['title'],
            blurb: jsonData['data'][key]['blurb'],
            info: Info.fromJson(jsonData, key),
            image: Image.fromJson(jsonData, key),
            tags: jsonData['data'][key]['tags'],
            partype: jsonData['data'][key]['partype'],
            stats: Stats.fromJson(jsonData, key));

            champs.add(champion);
    });
  }
  return champs;
}
