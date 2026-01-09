import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/failuer.dart';
import 'package:dua_zekr/features/hadeeth_details/data/mapper/hadeeth_details_mapper.dart';
import 'package:dua_zekr/features/hadeeth_details/domain/entity/hadeeth_data.dart';

import '../../../../core/network/error_exception.dart';
import '../../domain/repo/get_hadeeth_details.dart';
import '../service/get_hadeeth_details.dart';

class GetHadeethDetailsImpl extends GetHadeethDetails {
  GetHadeethDetailsService api;
  GetHadeethDetailsImpl(this.api);

  @override
  Future<Either<Failure, HadeethDtailsData>> getHadeethDetails(
    String id,
  ) async {
    try {
      final data = await api.getHadeethDetails(id);
      HadeethDtailsData hadeethDtailsData = data.toEntity();
      return right(hadeethDtailsData);
    } on NetWorkException {
      return Left(NetWorkFailuer("NetWork Error"));
    } on ServerException {
      return Left(ServerFailuer("Server Error"));
    }
  }
}
