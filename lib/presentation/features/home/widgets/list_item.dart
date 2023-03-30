import 'package:album_demo/domain/constants/app_size.dart';
import 'package:album_demo/domain/constants/images.dart';
import 'package:album_demo/domain/entities/user/user.dart';
import 'package:album_demo/presentation/base/route/route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final User data;

  const ListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppSize.listCardSize,
            height: AppSize.listCardSize,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.borderRadius),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: data.avatarUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                Images.noAvatarImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.username,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  data.email,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
