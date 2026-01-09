import 'package:dartz/dartz.dart';

import '../../../../core/network/failuer.dart';
import '../entity/hadeeth_data.dart';

abstract class GetAhdeethOfCategory {
  Future<Either<Failure, List<HadeethData>>> getAllHadeethOfCategory({
    required String id,
    String language = "ar",
    String page = "1",
    String per_page = "20",
  });
}
