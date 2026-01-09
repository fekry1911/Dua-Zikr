import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/failuer.dart';

import '../entity/hadeeth_data.dart';

abstract class GetHadeethDetails {
  Future<Either<Failure, HadeethDtailsData>> getHadeethDetails(String id);
}
