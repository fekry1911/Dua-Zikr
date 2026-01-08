import 'dart:convert';

import 'package:dua_zekr/features/home/data/models/dua_model.dart';
import 'package:flutter/services.dart';

class GetDuaService {
  Future<List<Dua>> getDua() async {
    try {
      final String jsonData = await rootBundle.loadString(
        'assets/dua_data/dua.json',
      );
      final List<dynamic> data = jsonDecode(jsonData);
      return data.map((dua) => Dua.fromJson(dua)).toList();
    } catch (e) {
      print('Error loading dua JSON: $e');
      return [];
    }
  }
}
