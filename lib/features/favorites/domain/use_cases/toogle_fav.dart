import '../../../hadeeths_of_category/domain/entity/hadeeth_data.dart';
import '../../data/models/fav_model.dart';
import '../repos/manage_favs.dart';

class ToggleFavorite {
  final ManageFavs repo;

  ToggleFavorite(this.repo);

  Future<void> call(HadeethData fav) {
    return repo.toggleOneFavorite(fav);
  }
}
