import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/data/models/category/category.dart';
import 'package:watamuki/src/data/repositories/category/category_repository.dart';
import 'package:watamuki/src/injector.dart';
import 'package:watamuki/src/presentation/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/coupon_card.dart';
import 'package:watamuki/src/presentation/widgets/molecules/title_bar.dart';

class CouponPage extends StatefulWidget {
  static const routeName = 'coupons';
  final CategoryRepository _categoryRepository =
      getIt.get<CategoryRepository>();

  CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage>
    with AutomaticKeepAliveClientMixin<CouponPage> {
  Category selectedCategory = Category(id: 0, name: "");

  List<Category> categories = [];

  Future<bool> getAllCategory() async {
    final response = await widget._categoryRepository
        .getAllPublicCategory(CategoryParams(type: CategoryType.coupon.value));
    setState(() {
      categories = response.data as List<Category>;
      if (selectedCategory.id == 0) {
        selectedCategory = categories[0];
      }
    });
    return true;
  }

  Future<bool> refresh() async {
    bool loading = await getAllCategory();
    return Future.value(loading);
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    String title = CouponPage.routeName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.local_activity_outlined),
        const SizedBox(height: 8),
        if (categories.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 54),
            child: LinearProgressIndicator(),
          )
        else
          CategoryTabBar<Category>(
            itemKey: "name",
            tabs: categories,
            onTap: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
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
