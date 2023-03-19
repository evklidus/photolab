import 'package:flutter/material.dart';
import 'package:photolab/features/feed/presentation/widgets/new_photos_tab.dart';
import 'package:photolab/features/feed/presentation/widgets/popular_photos_tab.dart';
import 'package:photolab/helper/constants/color_constants.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: ColorConstants.accent,
            tabs: [
              Tab(
                child: Text(
                  // TODO: Вынести все слова в константы или в l10n
                  'New',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              // TODO: Разнести табы по отдельным виджетам
              Tab(
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          title: const Text('Photolab'),
        ),
        body: const TabBarView(
          children: [
            NewPhotosTab(),
            PopularPhotosTab(),
          ],
        ),
      ),
    );
  }
}
