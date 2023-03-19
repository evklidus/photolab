import 'package:photolab/features/feed/data/models/photo_model.dart';
import 'package:photolab/services/client/client.dart';

abstract class FeedRemoteDataSource {
  Future<List<PhotoModel>> getNewPhotos(int page);
  Future<List<PhotoModel>> getPopularPhotos(int page);
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  FeedRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<PhotoModel>> getNewPhotos(int page) async {
    final data = await apiClient.getNewPhotos(page);
    final newPhotos = data.map((photo) => PhotoModel.fromJson(photo)).toList();
    return newPhotos;
  }

  @override
  Future<List<PhotoModel>> getPopularPhotos(int page) async {
    final data = await apiClient.getPopularPhotos(page);
    final popularPhotos =
        data.map((photo) => PhotoModel.fromJson(photo)).toList();
    return popularPhotos;
  }
}
