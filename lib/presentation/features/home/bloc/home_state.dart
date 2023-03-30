import 'package:album_demo/presentation/base/bloc/base_state.dart';
import 'package:album_demo/domain/entities/user/user.dart';

class HomeState extends BaseState {
  final bool isList;
  final int currentPage;
  final int totalPage;
  final List<User> listData;

  const HomeState({
    this.isList = true,
    this.currentPage = 0,
    this.totalPage = 1,
    this.listData = const [],
  });

  HomeState copyWith({
    bool? isList,
    int? currentPage,
    int? totalPage,
    List<User>? listData,
  }) =>
      HomeState(
        isList: isList ?? this.isList,
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        listData: listData ?? this.listData,
      );

  @override
  List<Object?> get props => [isList, currentPage, totalPage, listData];
}

class HomeInitialState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
