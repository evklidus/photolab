import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photolab/features/feed/domain/entities/photo_entity.dart';
import 'package:photolab/features/feed/domain/usecases/get_new_photos.dart';

part 'new_photos_event.dart';
part 'new_photos_state.dart';

class NewPhotosBloc extends Bloc<NewPhotosEvent, NewPhotosState> {
  final GetNewPhotos getNewPhotos;

  NewPhotosBloc(this.getNewPhotos) : super(NewPhotosInitialState()) {
    on<NewPhotosEvent>((event, emit) async {
      if (event is GetNewPhotosEvent) {
        try {
          emit(NewPhotosLoadingState());
          final List<PhotoEntity> downloadedPhotos =
              await getNewPhotos(event.page);
          final nextPage = event.page + 1;
          emit(NewPhotosLoadedState(downloadedPhotos, nextPage));
        } catch (error) {
          emit(NewPhotosErrorState(error as Exception));
        }
      }
    });
  }
}
