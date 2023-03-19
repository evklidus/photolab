import 'package:flutter/material.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/helper/constants/color_constants.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen(this.photo, {super.key});

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          photo.imageInBytes != null
              ? AspectRatio(
                  aspectRatio: 360 / 200,
                  child: Image.memory(
                    photo.imageInBytes!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              : const Placeholder(),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Вынести все TextStyle в константы
                Text(
                  photo.name,
                  style: const TextStyle(
                    // TODO: Использовать ScreenUtil, чтобы можно было использовать сайз из фигмы
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.title,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  photo.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
