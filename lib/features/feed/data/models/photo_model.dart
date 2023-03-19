import 'dart:typed_data';

import 'package:photolab/features/feed/data/models/photo_path_model.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required int id,
    required String name,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    required PhotoPathModel photoPathModel,
    required String? user,
    required Uint8List? imageInBytes,
  }) : super(
          id: id,
          name: name,
          dateCreate: dateCreate,
          description: description,
          isNew: isNew,
          isPopular: isPopular,
          photoPathEntity: photoPathModel,
          user: user,
          imageInBytes: imageInBytes,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      name: json['name'],
      dateCreate: DateTime.parse(json['dateCreate']),
      description: json['description'],
      isNew: json['new'],
      isPopular: json['popular'],
      photoPathModel: PhotoPathModel.fromJson(json['image']),
      user: json['user'],
      imageInBytes: json['imageInBytes'],
    );
  }
}
