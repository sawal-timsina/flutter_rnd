import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:query_provider/models/query_object.dart';
import 'package:query_provider/providers/infinite_query_provider.dart';
import 'package:query_provider/providers/query_provider.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/core/params/coupon.dart';
import 'package:watamuki/src/core/utils/constants.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/coupon/coupon.dart';
import 'package:watamuki/src/services/index.dart';
import 'package:watamuki/src/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/widgets/molecules/coupon_card.dart';
import 'package:watamuki/src/widgets/molecules/title_bar.dart';

class CouponPage extends StatefulWidget {
  static const routeName = 'Coupons';
  final ScrollController _controller = ScrollController();

  CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage>
    with AutomaticKeepAliveClientMixin<CouponPage> {
  final _categoryQuery = QueryProvider<List<Category>>(
    "coupon_category",
    categoryService.getAllCategory,
    params: CategoryParams(type: CategoryType.coupon.value),
    select: (data) {
      return data["data"];
    },
  );

  final _couponQuery = InfiniteQueryProvider<List<Coupon>>(
    "all_public_coupons",
    couponService.getAllCoupons,
    select: (data) {
      return data["data"];
    },
    getNextPageParam: (lastPage) {
      final String? date = lastPage.isNotEmpty ? lastPage.last.createdAt : "";
      if (date != null) {
        return date;
      }
      return null;
    },
    enabled: false,
  );

  void setCouponParams({Category? category}) {
    CouponParams oldParams = _couponQuery.params != null
        ? _couponQuery.params as CouponParams
        : CouponParams();
    _couponQuery.params = CouponParams(
      categoryId: category?.id ?? oldParams.categoryId,
    );
  }

  void onError(Exception e) {
    if (e is DioError) {
      final message = e.response!.data["error"] ?? e.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void initState() {
    _categoryQuery.dataStream.listen((_categories) {
      var categories = _categories.data;
      if (categories != null) {
        if (_couponQuery.params == null && categories.isNotEmpty) {
          setCouponParams(category: categories.first);
          _couponQuery.enabled = true;
        }
      }
    });

    widget._controller.addListener(() {
      if (widget._controller.offset ==
          widget._controller.position.maxScrollExtent) {
        _couponQuery.fetchNextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = CouponPage.routeName;

    _categoryQuery.onError ??= (e) => onError(e);
    _couponQuery.onError ??= (e) => onError(e);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.local_activity_outlined),
        StreamBuilder<QueryObject<List<Category>>>(
          stream: _categoryQuery.dataStream,
          builder: (_, AsyncSnapshot<QueryObject<List<Category>>> snap) {
            final categories = [
              Category(name: "スタンプラリー", id: 0),
              ...?(snap.data?.data)
            ];
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: categories,
              onTap: (value) {
                setCouponParams(category: value);
                widget._controller.animateTo(
                  widget._controller.position.minScrollExtent,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn,
                );
              },
            );
          },
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await _categoryQuery.refetch();
              await _couponQuery.refetch();
              return Future.value();
            },
            child: StreamBuilder<QueryObject<List<List<Coupon>>>>(
              stream: _couponQuery.dataStream,
              builder: (_, snap) {
                final coupons = (snap.data?.data ?? [[]]).flatten();
                return ListView.builder(
                  controller: widget._controller,
                  itemCount: coupons.length,
                  itemBuilder: (_, int index) {
                    final coupon = coupons[index] as Coupon;
                    return CouponCard(
                      imageUrl: coupon.image,
                      title: coupon.title,
                      benefits: coupon.benefits,
                      useTimes: coupon.useTimes,
                      startDate: coupon.startDate,
                      endDate: coupon.endDate,
                      isSpecial: coupon.isSpecial,
                      useCount: coupon.useCount,
                      onButtonPress: () {
                        print("open bottom sheet");
                      },
                    );
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
