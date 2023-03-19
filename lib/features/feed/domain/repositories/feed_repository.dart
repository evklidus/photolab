import 'package:photolab/features/feed/domain/entities/photo_entity.dart';

abstract class FeedRepository {
  Future<List<PhotoEntity>> getNewPhotos(int page);
  Future<List<PhotoEntity>> getPopularPhotos(int page);
}
