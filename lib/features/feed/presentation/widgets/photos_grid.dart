import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photolab/components/custom_error_widget.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/presentation/widgets/photo_widget.dart';
import 'package:photolab/utilities/exception_to_message.dart';
import 'package:provider/provider.dart';

class PhotosGrid extends StatefulWidget {
  const PhotosGrid({super.key});

  @override
  State<PhotosGrid> createState() => _PhotosGridState();
}

class _PhotosGridState extends State<PhotosGrid> {
  late PagingController<int, PhotoEntity> _pagingController;

  /*
  Необходимо выполнять в didChangeDependencies, а не в initState, 
  потому что состояние контроллера должно меняться при перестроении виджета
  Статья: https://medium.com/@gerhardwmalan/thanks-michael-for-this-very-useful-and-easy-to-read-article-6760dc80c6e4
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pagingController =
        Provider.of<PagingController<int, PhotoEntity>>(context);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => RefreshIndicator(
        onRefresh: () => Future.sync(_pagingController.refresh),
        child: PagedGridView(
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: _pagingController,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 159 / 100,
          ),
          builderDelegate: PagedChildBuilderDelegate<PhotoEntity>(
            itemBuilder: (context, photo, index) => PhotoWidget(photo),
            firstPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
              errorMessage: exceptionToMessage(_pagingController.error),
              onRefreshPressed: _pagingController.retryLastFailedRequest,
            ),
            newPageErrorIndicatorBuilder: (context) => CustomErrorWidget(
              errorMessage: exceptionToMessage(_pagingController.error),
              onRefreshPressed: _pagingController.retryLastFailedRequest,
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('Empty'),
            ),
          ),
        ),
      ),
    );
  }
}
