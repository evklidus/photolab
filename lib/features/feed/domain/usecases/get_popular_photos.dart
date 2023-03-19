import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/domain/repositories/feed_repository.dart';

class GetPopularPhotos {
  const GetPopularPhotos(this.feedRepository);

  final FeedRepository feedRepository;

  Future<List<PhotoEntity>> call(int page) async {
    final newPhotos = await feedRepository.getPopularPhotos(page);
    return newPhotos;
  }
}
