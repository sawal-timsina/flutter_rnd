import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/widgets/atoms/button.dart';
import 'package:watamuki/src/widgets/atoms/tag.dart';
import 'package:watamuki/src/widgets/molecules/coupon_view.dart';

class CouponCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String benefits;
  final int useTimes;
  final int? useCount;
  final String? startDate;
  final String endDate;
  final String imageUrl;
  final String? buttonTitle;
  final bool? isSpecial;

  final GestureTapCallback? onButtonPress;

  const CouponCard({
    Key? key,
    required this.title,
    this.subTitle,
    required this.imageUrl,
    required this.benefits,
    required this.useTimes,
    required this.startDate,
    required this.endDate,
    this.isSpecial,
    this.useCount,
    this.buttonTitle,
    this.onButtonPress,
  }) : super(key: key);

  bool isComing() {
    if (startDate != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return DateTime.tryParse(startDate!)
              ?.isAfter(DateTime.tryParse(formatter.format(DateTime.now()))!) ??
          false;
    }
    return false;
  }

  bool isExpired() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return DateTime.tryParse(endDate)
            ?.isBefore(DateTime.tryParse(formatter.format(DateTime.now()))!) ??
        false;
  }

  String getEndDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.tryParse(endDate)!);
  }

  String getStartDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.tryParse(startDate!)!);
  }

  bool isUsed() {
    return useTimes != 0 && useTimes - (useCount ?? 0) <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return CouponView(
      dividerColor: AppColors.greyDark,
      axis: Axis.vertical,
      arcSize: const Size(24, 24),
      borderRadius: 16,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                if (subTitle != null) ...[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    subTitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tag(
                      type: TagType.transparent,
                      icon: Icons.loyalty_outlined,
                      title: tr("Benefits") + " : $benefits",
                      padding: const EdgeInsets.symmetric(horizontal: 0.1),
                      textStyle: const TextStyle(color: AppColors.greyDark),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Tag(
                      type: TagType.transparent,
                      icon: Icons.local_activity_outlined,
                      title: tr("No of times") +
                          " : " +
                          (useTimes == 0
                                  ? tr("Unlimited")
                                  : (useTimes - (useCount ?? 0)) < 0
                                      ? 0
                                      : useTimes - (useCount ?? 0))
                              .toString(),
                      padding: const EdgeInsets.symmetric(horizontal: 0.1),
                      textStyle: const TextStyle(color: AppColors.greyDark),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tag(
                      type: TagType.transparent,
                      icon: isSpecial! ? null : Icons.today_outlined,
                      title: isSpecial!
                          ? ""
                          : tr("Start") + " : " + getStartDate(),
                      padding: const EdgeInsets.symmetric(horizontal: 0.1),
                      textStyle: const TextStyle(color: AppColors.greyDark),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Tag(
                      type: TagType.transparent,
                      icon: Icons.today_outlined,
                      title: tr("Expiry") + " : " + getEndDate(),
                      padding: const EdgeInsets.symmetric(horizontal: 0.1),
                      textStyle: const TextStyle(color: AppColors.greyDark),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Button(
              disabled: isComing() | isExpired() | isUsed(),
              type: isExpired() | isUsed()
                  ? ButtonType.filled
                  : isComing() | (buttonTitle ?? "").isNotEmpty
                      ? ButtonType.outlined
                      : ButtonType.filled,
              label: tr(
                isComing()
                    ? "Coming soon"
                    : isExpired()
                        ? "Coupon expired"
                        : isUsed()
                            ? "Coupon used"
                            : (buttonTitle ?? "").isNotEmpty
                                ? (buttonTitle ?? "")
                                : (isSpecial!
                                    ? "Use stamp rally coupon"
                                    : "Use this coupon"),
              ),
              onPressed: onButtonPress!,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      elevation: 8,
      shadowColor: AppColors.greyLight,
    );
  }
}
