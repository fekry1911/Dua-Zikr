import 'dart:convert';

import 'package:dua_zekr/features/duas/data/models/adhkar_model.dart';
import 'package:flutter/services.dart';

class GetAllDuaService {
  Future<List<Adhkar>> getDuas(String assetFile) async {
    try {
      final String jsonData = await rootBundle.loadString(assetFile);
      final List<dynamic> data = jsonDecode(jsonData);
      return data.map((dua) => Adhkar.fromJson(dua)).toList();
    } catch (e) {
      print('Error loading dua JSON: $e');
      return [];
    }
  }
}
