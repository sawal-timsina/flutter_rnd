import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:query_provider/models/query_object.dart';
import 'package:query_provider/providers/infinite_query_provider.dart';
import 'package:query_provider/providers/query_provider.dart';

import '../../core/params/category.dart';
import '../../core/params/facility.dart';
import '../../core/utils/constants.dart';
import '../../models/category/category.dart';
import '../../models/facility/facility.dart';
import '../../services/index.dart';
import '../../widgets/molecules/category_tab_bar.dart';
import '../../widgets/molecules/list_item.dart';
import '../../widgets/molecules/title_bar.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'Facilities';
  final ScrollController _controller = ScrollController();

  FacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with AutomaticKeepAliveClientMixin<FacilitiesPage> {
  final _categoryQuery = QueryProvider<Response, List<Category>>(
    "facility_category",
    categoryService.getAllCategory,
    params: CategoryParams(type: CategoryType.facility.value),
    select: (res) {
      return res.data["data"];
    },
  );

  final _facilityQuery = InfiniteQueryProvider<Response, List<Facility>>(
    "all_public_facilities",
    facilityService.getAllFacilities,
    select: (res) {
      return res.data["data"];
    },
    getNextPageParam: (lastPage) {
      final String? date = lastPage.isNotEmpty ? lastPage.last.updatedAt : "";
      if (date != null) {
        return date;
      }
      return null;
    },
    enabled: false,
  );

  void setFacilityParams({Category? category}) {
    FacilityParams oldParams = _facilityQuery.params != null
        ? _facilityQuery.params as FacilityParams
        : FacilityParams();
    _facilityQuery.params = FacilityParams(
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
        if (_facilityQuery.params == null && categories.isNotEmpty) {
          setFacilityParams(category: categories.first);
          _facilityQuery.enabled = true;
        }
      }
    });

    widget._controller.addListener(() {
      _facilityQuery.behaviour;
      if ((widget._controller.offset ==
          widget._controller.position.maxScrollExtent)) {
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
            return CategoryTabBar<Category>(
              itemKey: "name",
              tabs: snap.data?.data ?? [],
              onTap: (value) {
                setFacilityParams(category: value);
                _facilityQuery.refetch();
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
