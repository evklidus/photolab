import 'package:flutter/material.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/presentation/pages/photo_screen.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget(this.photo, {super.key});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhotoScreen(photo),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: photo.imageInBytes != null
            ? Image.memory(
                photo.imageInBytes!,
                fit: BoxFit.cover,
              )
            : const Placeholder(),
      ),
    );
  }
}
