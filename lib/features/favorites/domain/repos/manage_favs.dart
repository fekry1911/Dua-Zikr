import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../../data/models/fav_model.dart';

abstract class ManageFavs{
  Future<List<HadeethData>> getAllFavorites();
  Future<void> toggleOneFavorite(HadeethData hadeeth);
  Future<bool> isInFavorite(String id);
  Future<void> clearAllFavorites();
  }