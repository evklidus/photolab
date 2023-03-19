import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/domain/repositories/feed_repository.dart';

class GetNewPhotos {
  const GetNewPhotos(this.feedRepository);

  final FeedRepository feedRepository;

  Future<List<PhotoEntity>> call(int page) async {
    final newPhotos = await feedRepository.getNewPhotos(page);
    return newPhotos;
  }
}
