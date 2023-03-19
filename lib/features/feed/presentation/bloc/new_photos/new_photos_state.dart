part of 'new_photos_bloc.dart';

abstract class NewPhotosState extends Equatable {
  const NewPhotosState();

  @override
  List<Object> get props => [];
}

class NewPhotosInitialState extends NewPhotosState {}

class NewPhotosLoadingState extends NewPhotosState {}

class NewPhotosLoadedState extends NewPhotosState {
  const NewPhotosLoadedState(
    this.photos,
    this.nextPage,
  );

  final List<PhotoEntity> photos;
  final int nextPage;

  @override
  List<Object> get props => [photos];
}

class NewPhotosErrorState extends NewPhotosState {
  const NewPhotosErrorState(this.error);

  final Exception error;
}
