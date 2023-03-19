part of 'popular_photos_bloc.dart';

abstract class PopularPhotosState extends Equatable {
  const PopularPhotosState();

  @override
  List<Object> get props => [];
}

class PopularPhotosInitialState extends PopularPhotosState {}

class PopularPhotosLoadingState extends PopularPhotosState {}

class PopularPhotosLoadedState extends PopularPhotosState {
  const PopularPhotosLoadedState(
    this.photos,
    this.nextPage,
  );

  final List<PhotoEntity> photos;
  final int nextPage;

  @override
  List<Object> get props => [photos];
}

class PopularPhotosErrorState extends PopularPhotosState {
  const PopularPhotosErrorState(this.error);

  final Exception error;
}
