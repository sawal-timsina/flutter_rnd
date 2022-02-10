import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/QueryProviders/infinite_query_provider.dart';
import 'package:watamuki/src/core/QueryProviders/models/query_object.dart';
import 'package:watamuki/src/core/QueryProviders/query_provider.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/core/utils/constants.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/facility/facility.dart';
import 'package:watamuki/src/services/index.dart';
import 'package:watamuki/src/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/widgets/molecules/list_item.dart';
import 'package:watamuki/src/widgets/molecules/title_bar.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'Facilities';
  final ScrollController _controller = ScrollController();

  FacilitiesPage({Key? key}) : super(key: key);

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

  final _facilityQuery = InfiniteQueryProvider<List<Facility>>(
    "all_public_facilities",
    facilityService.getAllFacilities,
    select: (data) {
      return data["data"];
    },
    getNextPageParam: (lastPage) {
      final String? date = lastPage.isNotEmpty ? lastPage.last.updatedAt : "";
      if (date != null) {
        return date;
      }
      return null;
    },
    fetchOnMount: false,
  );

  void refetchFacility({Category? category}) {
    FacilityParams? oldParams = FacilityParams();
    if (_facilityQuery.params is FacilityParams) {
      oldParams = _facilityQuery.params as FacilityParams;
    }
    _facilityQuery.params = FacilityParams(
      categoryId: category?.id ?? oldParams.categoryId,
    );
    _facilityQuery.refetch();
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
    widget._controller.addListener(() {
      if (widget._controller.offset ==
          widget._controller.position.maxScrollExtent) {
        _facilityQuery.fetchNextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = FacilitiesPage.routeName;

    _categoryQuery.onError ??= (e) => onError(e);
    _facilityQuery.onError ??= (e) => onError(e);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.grid_view),
        StreamBuilder<QueryObject<List<Category>>>(
          stream: _categoryQuery.dataStream,
          builder: (_, snap) {
            final categories = snap.data?.data ?? [];
            if (_facilityQuery.params == null && categories.isNotEmpty) {
              refetchFacility(category: categories.first);
            }
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: categories,
              onTap: (value) {
                refetchFacility(category: value);
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
              await _facilityQuery.refetch();
              return Future.value();
            },
            child: StreamBuilder<QueryObject<List<List<Facility>>>>(
              stream: _facilityQuery.dataStream,
              builder: (_, snap) {
                final facilities = (snap.data?.data ?? [[]]).flatten();
                return ListView.builder(
                  controller: widget._controller,
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
