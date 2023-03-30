import 'package:album_demo/domain/entities/user/user.dart';
import 'package:album_demo/presentation/features/home/widgets/grid_item.dart';
import 'package:album_demo/presentation/features/home/widgets/grid_item_skeleton.dart';
import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  final List<User> data;
  final bool canLoadMore;
  final ScrollController controller;

  const HomeGridView({
    super.key,
    required this.data,
    required this.canLoadMore,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      physics: const PageScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        childAspectRatio: 0.6,
      ),
      itemCount: canLoadMore ? data.length + 2 : data.length,
      itemBuilder: (context, index) {
        if (index > data.length - 1) {
          return const GridItemSkeleton();
        } else {
          return GridItem(data: data[index]);
        }
      },
    );
  }
}
