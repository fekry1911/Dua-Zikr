import 'package:dartz/dartz.dart';

import '../../../../core/network/failuer.dart';
import '../../data/models/hadith_category.dart';

abstract class GetAllCategories{
  Future<Either<Failure, List<HadithCategory>>> getAllCategories();
}

