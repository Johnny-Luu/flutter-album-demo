import 'package:album_demo/application/usecases/album/load_data_usecase.dart';
import 'package:album_demo/presentation/base/bloc/base_bloc.dart';
import 'package:album_demo/domain/entities/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final LoadAlbumDataUseCase loadAlbumDataUseCase;

  HomeBloc({required this.loadAlbumDataUseCase}) : super(HomeInitialState());

  final ScrollController scrollController = ScrollController();

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }

  void onInit() async {
    add(LoadAlbumListEvent((state.currentPage + 1).toString()));
    scrollController.addListener(_handleScrollListener);
  }

  bool canLoadMore() => state.currentPage < state.totalPage;

  void _handleScrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (canLoadMore()) {
        add(LoadAlbumListEvent((state.currentPage + 1).toString()));
      }
    }
  }

  @override
  Future<void> handleEvent(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeInitialEvent) {
      onInit();
    } else if (event is ChangeViewEvent) {
      emit(state.copyWith(isList: event.isList));
    } else if (event is RefreshAlbumListEvent) {
      emit(
        state.copyWith(
          currentPage: 0,
          totalPage: 1,
          listData: [],
        ),
      );
    } else if (event is LoadAlbumListEvent) {
      await makeApiRequest(
        emit,
        callToHost: loadAlbumDataUseCase.call(
          ParamLoadData(page: event.page),
        ),
        success: (Emitter<HomeState> emit, UserData? userData) {
          if (userData != null) {
            emit(
              state.copyWith(
                currentPage: state.currentPage + 1,
                totalPage: userData.totalPage,
                listData: [...state.listData, ...userData.data],
              ),
            );
          }
        },
        error: (Emitter<HomeState> emit, String message) {
          emit(HomeErrorState(message));
        },
      );
    }
  }
}
