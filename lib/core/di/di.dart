import 'package:dio/dio.dart';
import 'package:dua_zekr/core/network/dio_hadeeth_config.dart';
import 'package:dua_zekr/features/home/data/repo_impl/get_dua_impl.dart';
import 'package:dua_zekr/features/home/domain/repos/get_dua.dart';
import 'package:get_it/get_it.dart';
import '../../features/all_ahadeth/data/repos/get_ahadeeth_impl.dart';
import '../../features/all_ahadeth/data/service/get_all_ahadeeth.dart';
import '../../features/all_ahadeth/domain/get_ahadeeth_list.dart';
import '../../features/all_ahadeth/presentation/logic/all_ahadeeth_cubit.dart';
import '../../features/home/data/repo_impl/get_categories_impl.dart';
import '../../features/home/data/service/get_categories_service.dart';
import '../../features/home/data/service/get_dua.dart';
import '../../features/home/domain/repos/get_categories.dart';
import '../../features/home/presentation/logic/categories_cubit.dart';
import '../../features/home/presentation/logic/get_dua_cubit.dart';

GetIt sl=GetIt.instance;

void setUp(){
  Dio dio=DioHadeethConfig.instance.dio;
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton<GetCategoriesService>(() => GetCategoriesService(sl<Dio>()));
  sl.registerLazySingleton<GetDuaService>(() => GetDuaService());
  sl.registerLazySingleton<GetAllAhadeeeth>(() => GetAllAhadeeeth(sl<Dio>()));



  //repos

  sl.registerLazySingleton<GetAllCategories>(() => GetAllCategoriesImpl(sl<GetCategoriesService>()));
  sl.registerLazySingleton<GetDua>(() => GetDuaImpl(sl<GetDuaService>()));
  sl.registerLazySingleton<GetAhadeethList>(() => GetAllAhadeethList(sl<GetAllAhadeeeth>()));



  //cubit

  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl<GetAllCategories>()));
  sl.registerFactory<GetDuaCubit>(() => GetDuaCubit(sl<GetDua>()));
  sl.registerFactory<AllAhadeethCubit>(() => AllAhadeethCubit(sl<GetAhadeethList>()));



}