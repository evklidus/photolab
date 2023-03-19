abstract class ApiClient {
  Future<List<Map<String, dynamic>>> getNewPhotos(int page);
  Future<List<Map<String, dynamic>>> getPopularPhotos(int page);
}
