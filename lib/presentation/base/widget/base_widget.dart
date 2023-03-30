import 'package:album_demo/presentation/base/bloc/base_bloc.dart';
import 'package:album_demo/presentation/base/bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseView<B extends BaseBloc, S extends BaseState>
    extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);

  late final B bloc;

  bool showAppbar() => true;

  String appbarTitle() => '';

  List<Widget> buildAppbarActions(BuildContext context) => [];

  Widget buildView(BuildContext context, S state);

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<B>(context);
    return BlocBuilder<B, BaseState>(
      builder: (contextBuilder, BaseState state) {
        return Scaffold(
          appBar: showAppbar() ? defaultAppbar(contextBuilder) : null,
          body: buildView(contextBuilder, state as S),
        );
      },
    );
  }

  AppBar? defaultAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle(),
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: buildAppbarActions(context),
    );
  }

  showDialogView({required BuildContext context, required String content}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: Text(content));
      },
    );
  }
}
