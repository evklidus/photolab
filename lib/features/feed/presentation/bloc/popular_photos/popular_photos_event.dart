part of 'popular_photos_bloc.dart';

abstract class PopularPhotosEvent extends Equatable {
  const PopularPhotosEvent();

  @override
  List<Object> get props => [];
}

class GetPopularPhotosEvent extends PopularPhotosEvent {
  const GetPopularPhotosEvent(this.page);

  final int page;
}
