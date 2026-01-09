import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/error_exception.dart';
import 'package:dua_zekr/core/network/failuer.dart';
import 'package:dua_zekr/features/hadeeths_of_category/data/mapper/haddeth_mapper.dart';
import 'package:dua_zekr/features/hadeeths_of_category/data/service/get_ahadeeths_service.dart';
import 'package:dua_zekr/features/hadeeths_of_category/domain/entity/hadeeth_data.dart';

import '../../domain/repos/get_ahdeeth_of_category.dart';

class GetAhadeethImpl extends GetAhdeethOfCategory {
  GetAhadeethsService api;

  GetAhadeethImpl(this.api);

  @override
  Future<Either<Failure, List<HadeethData>>> getAllHadeethOfCategory({
    required String id,
    String language = "ar",
    String page = "1",
    String per_page = "20",
  }) async {
    try {
      final data = await api.getAllHadeeths(
        id: id,
        language: language,
        page: page,
        per_page: per_page,
      );
      List<HadeethData> hadeeths = data.data.map((e) => e.toEntity()).toList();
      final hasReachedMax =
          data.meta.currentPageInt >= data.meta.lastPage;
      return Right(hadeeths);
    } on NetWorkException {
      return Left(NetWorkFailuer("NetWork Error"));
    } on ServerException {
      return Left(ServerFailuer("Server Error"));
    }
  }
}
