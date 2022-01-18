import 'package:flutter/material.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/presentation/widgets/atoms/tag.dart';

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
    TextStyle? titleStyle = Theme.of(context).textTheme.bodyText1;

    TextStyle? subTitleStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(color: AppColors.greyDark);

    TextStyle? captionTextStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(color: AppColors.greyDark);

    TextStyle? actionTextStyle = Theme.of(context).textTheme.caption?.copyWith(
          color: Theme.of(context).primaryColor,
          decoration: TextDecoration.underline,
        );

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
                    style: titleStyle,
                  ),
                  if (subTitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      subTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: subTitleStyle,
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
                      textStyle: captionTextStyle,
                    )
                  ],
                  if (actionTitle != null) ...[
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: onActionTap,
                      child: Text(
                        actionTitle!,
                        style: actionTextStyle,
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
