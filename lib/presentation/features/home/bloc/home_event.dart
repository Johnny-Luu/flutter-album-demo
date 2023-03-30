import 'package:album_demo/presentation/base/bloc/base_event.dart';

abstract class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class RefreshAlbumListEvent extends HomeEvent {}

class LoadAlbumListEvent extends HomeEvent {
  final String page;

  LoadAlbumListEvent(this.page);

  @override
  List<Object> get props => [page];
}

class ChangeViewEvent extends HomeEvent {
  final bool isList;

  ChangeViewEvent(this.isList);

  @override
  List<Object?> get props => [isList];
}
