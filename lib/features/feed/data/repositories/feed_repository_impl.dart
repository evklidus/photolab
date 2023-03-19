import 'package:photolab/core/errors/exceptions.dart';
import 'package:photolab/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/domain/repositories/feed_repository.dart';
import 'package:photolab/services/network_info/network_info.dart';

class FeedRepositoryImpl implements FeedRepository {
  const FeedRepositoryImpl({
    required this.feedRemoteDataSource,
    required this.networkInfo,
  });

  final FeedRemoteDataSource feedRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<List<PhotoEntity>> getNewPhotos(int page) async {
    // TODO: Если нет подключения к интернету, то использовать данные из БД
    if (!await networkInfo.isConnected) {
      throw InternetConnectionException();
    }
    try {
      final newPhotos = await feedRemoteDataSource.getNewPhotos(page);
      return newPhotos;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<PhotoEntity>> getPopularPhotos(int page) async {
    try {
      final popularPhotos = await feedRemoteDataSource.getPopularPhotos(page);
      return popularPhotos;
    } catch (e) {
      throw Exception();
    }
  }
}
