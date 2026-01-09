import 'package:dua_zekr/features/favorites/data/models/fav_model.dart';
import 'package:dua_zekr/features/favorites/domain/repos/manage_favs.dart';
import 'package:dua_zekr/features/hadeeths_of_category/data/mapper/haddeth_mapper.dart';

import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../service/toggle_fav.dart';

class ManageAllFavsImpl extends ManageFavs {
  FavoritesLocalService source;

  ManageAllFavsImpl(this.source);

  @override
  Future<void> clearAllFavorites() async {
    await source.clearFavorites();
  }

  @override
  Future<List<HadeethData>> getAllFavorites() async {
    var result = await source.getFavorites();
    List<HadeethData> data=result.map((e)=>e.toEntity()).toList();

    return data;
  }

  @override
  Future<bool> isInFavorite(String id) async {
    bool inFav = await source.isFavorite(id);
    return inFav;
  }

  @override
  Future<void> toggleOneFavorite(HadeethData hadeeth) async {
    final hadithModel = hadeeth.toModel(); // تحويل

    await source.toggleFavorite(hadithModel);
  }
}
