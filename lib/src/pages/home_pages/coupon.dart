import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_object.dart';
import 'package:watamuki/src/core/QueryProviders/query_provider.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/coupon/index.dart';
import 'package:watamuki/src/services/index.dart';
import 'package:watamuki/src/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/widgets/molecules/coupon_card.dart';
import 'package:watamuki/src/widgets/molecules/title_bar.dart';

class CouponPage extends StatefulWidget {
  static const routeName = 'coupons';

  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage>
    with AutomaticKeepAliveClientMixin<CouponPage> {
  void onError(Exception e) {
    if (e is DioError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  final _categoryQuery = QueryProvider<List<Category>>(
    "coupon_category",
    categoryService.getAllCategory,
    params: CategoryParams(type: CategoryType.coupon.value),
    select: (data) {
      return data["data"];
    },
  );

  final _couponQuery = QueryProvider<List<Coupon>>(
    "all_public_coupons",
    couponService.getAllCoupons,
    select: (data) {
      return data["data"];
    },
    fetchOnMount: false,
  );

  void refetchCoupon(Category category) {
    _couponQuery.params = FacilityParams(categoryId: category.id);
    _couponQuery.refetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = CouponPage.routeName;

    _categoryQuery.onError ??= (e) => onError(e);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.local_activity_outlined),
        const SizedBox(height: 8),
        StreamBuilder<QueryObject<List<Category>>>(
          stream: _categoryQuery.dataStream,
          builder: (_, AsyncSnapshot<QueryObject<List<Category>>> snap) {
            final categories = snap.data?.data ?? [];
            if (_couponQuery.params == null && categories.isNotEmpty) {
              refetchCoupon(categories.first);
            }
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: snap.data?.data ?? [],
              onTap: (value) {
                refetchCoupon(categories.first);
              },
            );
          },
        ),
        StreamBuilder<QueryObject<List<Coupon>>>(
          stream: _couponQuery.dataStream,
          builder: (_, snap) {
            final coupons = snap.data?.data ?? [];

            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await _categoryQuery.refetch();
                  await _categoryQuery.refetch();
                  return Future.value();
                },
                child: ListView.builder(
                  itemCount: coupons.length,
                  itemBuilder: (_, int index) {
                    return CouponCard(
                      imageUrl: coupons[index].image,
                      title: coupons[index].title,
                      benefits: coupons[index].benefits,
                      useTimes: coupons[index].useTimes,
                      startDate: coupons[index].startDate,
                      endDate: coupons[index].endDate,
                      onButtonPress: () {
                        print("open bottom sheet");
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
