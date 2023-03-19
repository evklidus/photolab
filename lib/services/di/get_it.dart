import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:photolab/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:photolab/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:photolab/features/feed/domain/repositories/feed_repository.dart';
import 'package:photolab/features/feed/domain/usecases/get_new_photos.dart';
import 'package:photolab/features/feed/domain/usecases/get_popular_photos.dart';
import 'package:photolab/features/feed/presentation/bloc/new_photos/new_photos_bloc.dart';
import 'package:photolab/features/feed/presentation/bloc/popular_photos/popular_photos_bloc.dart';
import 'package:photolab/services/client/client.dart';
import 'package:photolab/services/client/client_impl.dart';
import 'package:photolab/services/network_info/network_info.dart';
import 'package:photolab/services/network_info/network_info_impl.dart';

final getIt = GetIt.instance;

void setup() {
  // Bloc
  getIt.registerFactory<NewPhotosBloc>(
    () => NewPhotosBloc(getIt()),
  );
  getIt.registerFactory<PopularPhotosBloc>(
    () => PopularPhotosBloc(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetNewPhotos>(
    () => GetNewPhotos(getIt()),
  );
  getIt.registerLazySingleton<GetPopularPhotos>(
    () => GetPopularPhotos(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(
      feedRemoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<FeedRemoteDataSource>(
    () => FeedRemoteDataSourceImpl(getIt()),
  );

  // Services
  final internetConnectionChecker = InternetConnectionChecker();
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker));

  final dio = Dio();
  getIt.registerLazySingleton<ApiClient>(() => ApiClientImpl(dio));
}
