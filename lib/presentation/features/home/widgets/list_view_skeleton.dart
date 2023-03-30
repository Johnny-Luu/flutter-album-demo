import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'list_item_skeleton.dart';

class ListViewSkeleton extends StatelessWidget {
  const ListViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListItemSkeleton(),
        SizedBox(height: 12),
        ListItemSkeleton(),
        SizedBox(height: 12),
        ListItemSkeleton(),
        SizedBox(height: 12),
        ListItemSkeleton(),
        SizedBox(height: 12),
      ],
    );
  }
}
