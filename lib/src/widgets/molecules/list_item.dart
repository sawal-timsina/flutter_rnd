import 'package:flutter/material.dart'
    show
        AspectRatio,
        BorderRadius,
        BoxConstraints,
        BoxFit,
        BuildContext,
        ClipRRect,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        GestureDetector,
        GestureTapCallback,
        HitTestBehavior,
        IconData,
        Image,
        Key,
        Radius,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextDecoration,
        TextOverflow,
        Theme,
        Widget;

import '../../config/themes/colors.dart';
import '../atoms/tag.dart';

class ListItem<T> extends StatelessWidget {
  final String title;
  final String imageSrc;
  final String? subTitle;

  final GestureTapCallback? onTap;

  final String? actionTitle;
  final GestureTapCallback? onActionTap;

  final IconData? captionIcon;
  final String? captionTitle;

  const ListItem({
    Key? key,
    required this.title,
    this.subTitle,
    this.onTap,
    this.onActionTap,
    this.captionIcon,
    this.captionTitle,
    this.actionTitle,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 104,
        maxHeight: 128,
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  if (subTitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      subTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: AppColors.greyDark),
                    )
                  ],
                  if (captionTitle != null) ...[
                    const SizedBox(height: 8),
                    Tag(
                      type: TagType.transparent,
                      icon: captionIcon,
                      title: captionTitle!,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.1, horizontal: 0.1),
                      textStyle: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: AppColors.greyDark),
                    )
                  ],
                  if (actionTitle != null) ...[
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: onActionTap,
                      child: Text(
                        actionTitle!,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    )
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
