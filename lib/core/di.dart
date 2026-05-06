import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'save data/save_data.dart';
import 'security/security_helper.dart';
import 'api/dio_helper.dart';
import 'api/internet_connection_checker.dart';
import '../features/payment/data/datasources/payment_remote_data_source.dart';
import '../features/payment/data/datasources/payment_remote_data_source_impl.dart';
import '../core/api/api_consumer.dart';
import '../features/payment/data/repositories/payment_repository_impl.dart';
import '../features/payment/domain/repositories/payment_repository.dart';
import '../features/payment/domain/usecases/create_order_usecase.dart';
import '../features/payment/presentation/cubit/payment_cubit.dart';


final GetIt getIt = GetIt.instance;

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

  await DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

  // Payment feature dependencies
  getIt.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(api: ApiConsumer()),
  );

  getIt.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      remoteDataSource: getIt<PaymentRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<CreateOrderUseCase>(
    () => CreateOrderUseCase(repository: getIt<PaymentRepository>()),
  );

  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(createOrderUseCase: getIt<CreateOrderUseCase>()),
  );
}
