import 'dart:typed_data';

import 'package:photolab/features/feed/domain/entities/photo_path_entity.dart';

class PhotoEntity {
  const PhotoEntity({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.isNew,
    required this.isPopular,
    required this.photoPathEntity,
    required this.user,
    required this.imageInBytes,
  });

  final int id;
  final String name;
  final DateTime dateCreate;
  final String description;
  final bool isNew;
  final bool isPopular;
  final PhotoPathEntity photoPathEntity;
  final String? user;
  final Uint8List? imageInBytes;
}
