import 'package:album_demo/domain/constants/app_size.dart';
import 'package:album_demo/domain/constants/images.dart';
import 'package:album_demo/domain/entities/user/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final User data;

  const GridItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: AppSize.gridCardSize,
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(AppSize.cardPadding),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.username,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  data.email,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
