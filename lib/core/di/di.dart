import 'package:dio/dio.dart';
import 'package:dua_zekr/core/network/dio_hadeeth_config.dart';
import 'package:dua_zekr/features/favorites/data/repos/manage_favs_impl.dart';
import 'package:dua_zekr/features/favorites/domain/use_cases/clear_favs.dart';
import 'package:dua_zekr/features/favorites/presentation/logic/manage_fav_cubit.dart';
import 'package:dua_zekr/features/hadeeth_details/data/repo/get_hadeeth_details_impl.dart';
import 'package:dua_zekr/features/hadeeth_details/data/service/get_hadeeth_details.dart';
import 'package:dua_zekr/features/hadeeth_details/domain/repo/get_hadeeth_details.dart';
import 'package:dua_zekr/features/hadeeth_details/presentation/logic/hadeeth_details_cubit.dart';
import 'package:dua_zekr/features/home/data/repo_impl/get_dua_impl.dart';
import 'package:dua_zekr/features/home/domain/repos/get_dua.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/all_ahadeth/data/repos/get_ahadeeth_impl.dart';
import '../../features/all_ahadeth/data/service/get_all_ahadeeth.dart';
import '../../features/all_ahadeth/domain/get_ahadeeth_list.dart';
import '../../features/all_ahadeth/presentation/logic/all_ahadeeth_cubit.dart';
import '../../features/favorites/data/service/toggle_fav.dart';
import '../../features/favorites/domain/repos/manage_favs.dart';
import '../../features/favorites/domain/use_cases/get_favs.dart';
import '../../features/favorites/domain/use_cases/toogle_fav.dart';
import '../../features/hadeeths_of_category/data/repos/get_ahadeeths_impl.dart';
import '../../features/hadeeths_of_category/data/service/get_ahadeeths_service.dart';
import '../../features/hadeeths_of_category/domain/repos/get_ahdeeth_of_category.dart';
import '../../features/hadeeths_of_category/presentation/logic/ahadeeths_cubit.dart';
import '../../features/home/data/repo_impl/get_categories_impl.dart';
import '../../features/home/data/service/get_categories_service.dart';
import '../../features/home/data/service/get_dua.dart';
import '../../features/home/domain/repos/get_categories.dart';
import '../../features/home/presentation/logic/categories_cubit.dart';
import '../../features/home/presentation/logic/get_dua_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> setUp() async {
  Dio dio = DioHadeethConfig.instance.dio;
  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton<GetCategoriesService>(
    () => GetCategoriesService(sl<Dio>()),
  );
  sl.registerSingleton<SharedPreferences>(prefs);

  // Services
  sl.registerLazySingleton<GetDuaService>(() => GetDuaService());
  sl.registerLazySingleton<GetAllAhadeeeth>(() => GetAllAhadeeeth(sl<Dio>()));
  sl.registerLazySingleton<GetAhadeethsService>(
    () => GetAhadeethsService(sl<Dio>()),
  );
  sl.registerLazySingleton<GetHadeethDetailsService>(
    () => GetHadeethDetailsService(sl<Dio>()),
  );
  sl.registerSingleton<FavoritesLocalService>(
    FavoritesLocalService(sl<SharedPreferences>()),
  );

  //repos

  sl.registerLazySingleton<GetAllCategories>(
    () => GetAllCategoriesImpl(sl<GetCategoriesService>()),
  );
  sl.registerLazySingleton<GetDua>(() => GetDuaImpl(sl<GetDuaService>()));
  sl.registerLazySingleton<GetAhadeethList>(
    () => GetAllAhadeethList(sl<GetAllAhadeeeth>()),
  );
  sl.registerLazySingleton<GetAhdeethOfCategory>(
    () => GetAhadeethImpl(sl<GetAhadeethsService>()),
  );
  sl.registerLazySingleton<GetHadeethDetails>(
    () => GetHadeethDetailsImpl(sl<GetHadeethDetailsService>()),
  );
  sl.registerLazySingleton<ManageFavs>(
    () => ManageAllFavsImpl(sl<FavoritesLocalService>()),
  );

  //use cases
  sl.registerLazySingleton<GetAllFavorites>(
    () => GetAllFavorites(sl<ManageFavs>()),
  );
  sl.registerLazySingleton<ToggleFavorite>(
    () => ToggleFavorite(sl<ManageFavs>()),
  );
  sl.registerLazySingleton<ClearAllFavorites>(
    () => ClearAllFavorites(sl<ManageFavs>()),
  );

  //cubit
  sl.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(sl<GetAllCategories>()),
  );
  sl.registerFactory<GetDuaCubit>(() => GetDuaCubit(sl<GetDua>()));
  sl.registerFactory<AllAhadeethCubit>(
    () => AllAhadeethCubit(sl<GetAhadeethList>()),
  );
  sl.registerFactory<AhadeethsCubit>(
    () => AhadeethsCubit(sl<GetAhdeethOfCategory>()),
  );
  sl.registerFactory<HadeethDetailsCubit>(
    () => HadeethDetailsCubit(sl<GetHadeethDetails>()),
  );
  sl.registerFactory<ManageFavCubit>(
    () => ManageFavCubit(
      sl<ClearAllFavorites>(),
      sl<GetAllFavorites>(),
      sl<ToggleFavorite>(),
    ),
  );
}
