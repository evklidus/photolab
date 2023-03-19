import 'package:photolab/features/feed/domain/entities/photo_path_entity.dart';

class PhotoPathModel extends PhotoPathEntity {
  PhotoPathModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory PhotoPathModel.fromJson(Map<String, dynamic> json) {
    return PhotoPathModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
