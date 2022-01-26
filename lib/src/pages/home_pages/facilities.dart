import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/core/utils/query_provider.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/facility/facility.dart';
import 'package:watamuki/src/services/index.dart';
import 'package:watamuki/src/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/widgets/molecules/list_item.dart';
import 'package:watamuki/src/widgets/molecules/title_bar.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'facilities';

  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with AutomaticKeepAliveClientMixin<FacilitiesPage> {
  final _categoryQuery = QueryProvider<List<Category>>(
    "facility_category",
    categoryService.getAllCategory,
    params: CategoryParams(type: CategoryType.facility.value),
    select: (data) {
      return data["data"];
    },
  );

  final _facilityQuery = QueryProvider<List<Facility>>(
    "all_facilities",
    facilityService.getAllFacilities,
    fetchOnMount: false,
    select: (data) {
      return data["data"];
    },
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = FacilitiesPage.routeName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.grid_view),
        const SizedBox(height: 8),
        StreamBuilder<QueryObject<List<Category>>>(
          stream: _categoryQuery.dataStream,
          builder: (_, snap) {
            final categories = snap.data?.data ?? [];
            if (_facilityQuery.params == null && categories.isNotEmpty) {
              _facilityQuery.params =
                  FacilityParams(categoryId: categories.first.id);
              _facilityQuery.refetch();
            }
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: categories,
              onTap: (value) {
                _facilityQuery.params = FacilityParams(categoryId: value.id);
                _facilityQuery.refetch();
              },
            );
          },
        ),
        StreamBuilder<QueryObject<List<Facility>>>(
          stream: _facilityQuery.dataStream,
          builder: (_, snap) {
            final facilities = snap.data?.data ?? [];
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await _categoryQuery.refetch();
                  await _facilityQuery.refetch();
                  return Future.value();
                },
                child: ListView.builder(
                  itemCount: facilities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(
                      title: facilities[index].name,
                      subTitle: facilities[index].overview,
                      imageSrc: facilities[index].image,
                      actionTitle: "マップで開く",
                      onTap: () {
                        print(index);
                      },
                      onActionTap: () {
                        print({"title": "open in map", "index": index});
                      },
                    );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
