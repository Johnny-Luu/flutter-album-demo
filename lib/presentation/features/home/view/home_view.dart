import 'package:album_demo/domain/constants/app_size.dart';
import 'package:album_demo/presentation/base/widget/base_widget.dart';
import 'package:album_demo/presentation/features/home/bloc/home_bloc.dart';
import 'package:album_demo/presentation/features/home/bloc/home_event.dart';
import 'package:album_demo/presentation/features/home/bloc/home_state.dart';
import 'package:album_demo/presentation/features/home/view/home_grid_view.dart';
import 'package:album_demo/presentation/features/theme_wrapper/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_list_view.dart';

class HomeView extends BaseView<HomeBloc, HomeState> {
  HomeView({Key? key}) : super(key: key);

  @override
  String appbarTitle() => 'Album App';

  @override
  List<Widget> buildAppbarActions(BuildContext context) {
    ThemeMode currentTheme = context.watch<ThemeCubit>().state.themeMode;
    return [
      IconButton(
        color: Colors.white,
        onPressed: () {
          context
              .read<ThemeCubit>()
              .updateAppTheme(currentTheme == ThemeMode.light);
        },
        icon: Icon(
          currentTheme == ThemeMode.light
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
        ),
      ),
    ];
  }

  @override
  Widget buildView(BuildContext context, HomeState state) {
    if (state is HomeInitialState) {
      bloc.add(HomeInitialEvent());
    }
    if (state is HomeErrorState) {
      showDialogView(context: context, content: state.message);
    }
    return _buildBody(context, state);
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    final data = state.listData;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.verticalLayoutPadding,
        horizontal: AppSize.horizontalLayoutPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              state.isList ? Icons.list_sharp : Icons.grid_view_outlined,
            ),
            onPressed: () {
              bloc.add(ChangeViewEvent(!state.isList));
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                bloc.add(RefreshAlbumListEvent());
              },
              child: state.isList
                  ? HomeListView(
                      data: data,
                      canLoadMore: bloc.canLoadMore(),
                      controller: bloc.scrollController,
                    )
                  : HomeGridView(
                      data: data,
                      canLoadMore: bloc.canLoadMore(),
                      controller: bloc.scrollController,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
