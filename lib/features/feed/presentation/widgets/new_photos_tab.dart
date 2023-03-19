import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photolab/features/feed/presentation/bloc/new_photos/new_photos_bloc.dart';
import 'package:photolab/features/feed/presentation/widgets/photos_grid.dart';
import 'package:photolab/services/di/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:provider/provider.dart';

class NewPhotosTab extends StatefulWidget {
  const NewPhotosTab({super.key});

  @override
  State<NewPhotosTab> createState() => _NewPhotosTabState();
}

class _NewPhotosTabState extends State<NewPhotosTab>
    with AutomaticKeepAliveClientMixin {
  final NewPhotosBloc newPhotosBloc = getIt.get<NewPhotosBloc>();
  final _pagingController = PagingController<int, PhotoEntity>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((page) {
      newPhotosBloc.add(GetNewPhotosEvent(page));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider(
      create: (BuildContext context) => _pagingController,
      child: BlocListener(
        bloc: newPhotosBloc,
        listener: (context, state) {
          if (state is NewPhotosLoadedState) {
            final isLastPage = state.photos.length < 10; // 10 is page size
            if (isLastPage) {
              _pagingController.appendLastPage(state.photos);
            } else {
              _pagingController.appendPage(state.photos, state.nextPage);
            }
          }
          if (state is NewPhotosErrorState) {
            _pagingController.error = state.error;
          }
        },
        child: const PhotosGrid(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
