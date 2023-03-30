import 'package:album_demo/domain/entities/user/user.dart';
import 'package:album_demo/presentation/features/home/widgets/list_item.dart';
import 'package:album_demo/presentation/features/home/widgets/list_view_skeleton.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  final List<User> data;
  final bool canLoadMore;
  final ScrollController controller;

  const HomeListView({
    super.key,
    required this.data,
    required this.canLoadMore,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: data.length + 1,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == data.length) {
          return canLoadMore ? const ListViewSkeleton() : const SizedBox();
        } else {
          return ListItem(data: data[index]);
        }
      },
    );
  }
}
