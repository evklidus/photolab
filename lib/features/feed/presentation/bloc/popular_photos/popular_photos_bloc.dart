import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/domain/usecases/get_popular_photos.dart';

part 'popular_photos_event.dart';
part 'popular_photos_state.dart';

class PopularPhotosBloc extends Bloc<PopularPhotosEvent, PopularPhotosState> {
  final GetPopularPhotos getPopularPhotos;
  int page = 1;

  PopularPhotosBloc(this.getPopularPhotos)
      : super(PopularPhotosInitialState()) {
    on<PopularPhotosEvent>((event, emit) async {
      if (event is GetPopularPhotosEvent) {
        try {
          emit(PopularPhotosLoadingState());
          final List<PhotoEntity> downloadedPhotos =
              await getPopularPhotos(event.page);
          final nextPage = event.page + 1;
          emit(PopularPhotosLoadedState(downloadedPhotos, nextPage));
        } catch (error) {
          emit(PopularPhotosErrorState(error as Exception));
        }
      }
    });
  }
}
