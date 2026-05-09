import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:real_estate3_a/features/Auth/data/repo/AuthRepoImp.dart';
import 'package:real_estate3_a/features/Favorits/data/dataSource/favoriteRemoteDataSource.dart';
import 'package:real_estate3_a/features/Favorits/data/repo/favoriteRepoImp.dart';
import 'package:real_estate3_a/features/Favorits/domain/repo/favoriteRepo.dart';
import 'package:real_estate3_a/features/profile/data/datasources/profileRemoteDataSource.dart';
import 'package:real_estate3_a/features/profile/data/repo/profileRepoImp.dart';
import 'package:real_estate3_a/features/profile/domain/repo/profileRepo.dart';
import '../features/Home/data/RemoteDataSource/HomeRemoteDataSource.dart';
import '../features/Home/data/repo/HomeRepoImpl.dart';
import '../features/Home/domain/repo/HomeRepo.dart';
import 'package:real_estate3_a/features/Property%20Details/data/repos/property_details_repo_impl.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/cubit/property%20details%20cubit/property_details_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/cubit/similar_property_details_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'save data/save_data.dart';
import 'security/security_helper.dart';
import 'api/dio_helper.dart';
import 'api/internet_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerLazySingleton<CacheHelper>(() => cacheHelper);

  final securityHelper = SecurityHelper();
  getIt.registerLazySingleton<SecurityHelper>(() => securityHelper);

  final authStorage = AuthStorage(getIt<SecurityHelper>());
  await authStorage.migrateFromCacheIfNeeded(cacheHelper);
  await authStorage.loadFromSecure();
  getIt.registerLazySingleton<AuthStorage>(() => authStorage);

  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl());

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => const HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<FavoriteRemoteDataSource>(
    () => const FavoriteRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt<FavoriteRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  await DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

  // Property Details
  getIt.registerLazySingleton<PropertyDetailsRepo>(
    () => PropertyDetailsRepoImpl(),
  );
  getIt.registerLazySingleton<PropertyDetailsCubit>(
    () =>
        PropertyDetailsCubit(propertyDetailsRepo: getIt<PropertyDetailsRepo>()),
  );
  getIt.registerLazySingleton<SimilarPropertyDetailsCubit>(
    () => SimilarPropertyDetailsCubit(
      propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<ReviewsPropertyCubit>(
    () =>
        ReviewsPropertyCubit(propertyDetailsRepo: getIt<PropertyDetailsRepo>()),
  );
}
