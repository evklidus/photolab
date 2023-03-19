part of 'new_photos_bloc.dart';

abstract class NewPhotosEvent extends Equatable {
  const NewPhotosEvent();
  @override
  List<Object> get props => [];
}

class GetNewPhotosEvent extends NewPhotosEvent {
  const GetNewPhotosEvent(this.page);

  final int page;
}
