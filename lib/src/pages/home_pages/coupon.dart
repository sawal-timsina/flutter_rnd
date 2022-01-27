import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/QueryProviders/query_provider.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/models/category/category.dart';
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
  Category selectedCategory = Category(id: 0, name: "");

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

  final categoryQuery = QueryProvider<List<Category>>(
    "coupon_category",
    categoryService.getAllCategory,
    params: CategoryParams(type: CategoryType.coupon.value),
    select: (data) {
      return data["data"];
    },
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    categoryQuery.onError ??= (e) => onError(e);

    String title = CouponPage.routeName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.local_activity_outlined),
        const SizedBox(height: 8),
        StreamBuilder<QueryObject<List<Category>>>(
          stream: categoryQuery.dataStream,
          builder: (_, AsyncSnapshot<QueryObject<List<Category>>> snap) {
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: snap.data?.data ?? [],
              onTap: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            );
          },
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              categoryQuery.refetch();
              return Future.value();
            },
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return CouponCard(
                  imageUrl:
                  "https://storage.googleapis.com/watamuki-development/images/original/1640347742921780511.jpg",
                  title:
                  "data lkslajdl ajsld alsdkja ldjald kjalksdjlasdjlakjd lasdkjl alsdjals",
                  benefits: "30 % off",
                  useTimes: 3,
                  startDate: '2021-12-15',
                  endDate: '2022-02-15',
                  onButtonPress: () {
                    print("open bottom sheet");
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
