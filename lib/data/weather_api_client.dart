import 'dart:convert';

import 'package:flutter_weatherapp/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/';

  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL =
        Uri.parse(baseUrl + "api/location/search/?query=" + sehirAdi);
    final gelenCevap = await httpClient.get(sehirURL);

    if (gelenCevap.statusCode != 200) {
      throw Exception('Location Veri Getirilemedi');
    }
    final gelenCevapJson = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJson[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuURL = Uri.parse(baseUrl + 'api/location/$sehirID');
    final havaDurumuGelenCevap = await httpClient.get(havaDurumuURL);
    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception('Hava durumu Veri Getirilemedi');
    }
    final havaDurumuGelenJson = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuGelenJson);
  }
}
