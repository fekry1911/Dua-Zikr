import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../../data/models/fav_model.dart';
import '../repos/manage_favs.dart';

class GetAllFavorites {
  final ManageFavs repo;

  GetAllFavorites(this.repo);

  Future<List<HadeethData>> call() {
    return repo.getAllFavorites();
  }
}
