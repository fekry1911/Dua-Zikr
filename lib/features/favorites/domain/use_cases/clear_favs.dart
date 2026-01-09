import '../repos/manage_favs.dart';

class ClearAllFavorites {
  final ManageFavs repo;

  ClearAllFavorites(this.repo);

  Future<void> call() async {
    await repo.clearAllFavorites();
  }
}
