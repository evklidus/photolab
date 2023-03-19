import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:photolab/services/client/client.dart';

class ApiClientImpl implements ApiClient {
  ApiClientImpl(this.dio);

  final Dio dio;
  final itemsPerPageLimit = 10;
  final baseUrl = 'https://gallery.prod1.webant.ru/api';
  final photosPath = '/photos';
  final mediaObjectsPath = '/media_objects';

  @override
  Future<List<Map<String, dynamic>>> getNewPhotos(int page) async {
    return await _getPhotos(
      page,
      isNew: true,
      isPopular: false,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getPopularPhotos(int page) async {
    return await _getPhotos(
      page,
      isNew: false,
      isPopular: true,
    );
  }

  Future<List<Map<String, dynamic>>> _getPhotos(
    int page, {
    required bool isNew,
    required bool isPopular,
  }) async {
    final photosUrl = baseUrl + photosPath;
    final response = await dio.get(
      photosUrl,
      queryParameters: {
        'new': isNew,
        'popular': isPopular,
        'limit': itemsPerPageLimit,
        'page': page,
      },
    );
    List<Map<String, dynamic>> photos =
        List<Map<String, dynamic>>.from(response.data['data']);
    await _setImagesToPhotos(photos);

    return photos;
  }

  Future<void> _setImagesToPhotos(
    List<Map<String, dynamic>> photos,
  ) async {
    photos = await Future.wait(
      photos.map(
        (photo) async {
          final imageInBytes = await _getImageInBytesFromImageId(
            photo['image']['id'],
          );
          photo.addAll(
            {
              'imageInBytes': imageInBytes,
            },
          );
          return photo;
        },
      ).toList(),
    );
  }

  Future<Uint8List?> _getImageInBytesFromImageId(int id) async {
    final mediaObjectsUrl = '$baseUrl$mediaObjectsPath/$id';
    try {
      final response = await dio.get(mediaObjectsUrl);
      final String data = response.data['file'];
      final String base64EncodedString = data.split(',').last;
      final Uint8List imageInBytes = base64.decode(base64EncodedString);
      return imageInBytes;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
