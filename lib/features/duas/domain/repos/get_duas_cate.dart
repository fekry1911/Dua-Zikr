import 'package:dua_zekr/features/duas/data/models/adhkar_model.dart';

abstract class GetDuasOfCate{
  Future<List<Adhkar>> getAllDausOfCate(String assetFile);
}