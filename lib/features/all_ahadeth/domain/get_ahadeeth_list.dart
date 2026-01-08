import 'package:dartz/dartz.dart';

import '../../../core/network/failuer.dart';
import '../../home/data/models/hadith_category.dart';

abstract class GetAhadeethList{
  Future<Either<Failure, List<HadithCategory>>> getAllAhadeeth();
}