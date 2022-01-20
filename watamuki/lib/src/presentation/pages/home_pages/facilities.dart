import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/core/params/category.dart';
import 'package:watamuki/src/core/params/facility.dart';
import 'package:watamuki/src/data/models/category/category.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';
import 'package:watamuki/src/data/repositories/category/category_repository.dart';
import 'package:watamuki/src/data/repositories/facility/facility_repository.dart';
import 'package:watamuki/src/data/repositories/facility/facility_repository_impl.dart';
import 'package:watamuki/src/injector.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/atoms/tag.dart';
import 'package:watamuki/src/presentation/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/list_item.dart';

import 'facility_detail.dart';
import 'home_navigator.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'facilities';
  final FacilityRepository _facilityRepository = FacilityRepositoryImpl();
  final CategoryRepository _categoryRepository =
      getIt.get<CategoryRepository>();

  FacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with AutomaticKeepAliveClientMixin<FacilitiesPage> {
  bool categoryLoading = false;
  List<Category> categories = [];

  late Category selectedCategory;

  bool facilityLoading = false;
  List<Facility> facilities = [];

  Future<bool> getAllCategory() async {
    setState(() {
      categoryLoading = true;
    });
    final response = await widget._categoryRepository.getAllPublicCategory(
        CategoryParams(type: CategoryType.facility.value));
    setState(() {
      categories = response.data as List<Category>;
      categoryLoading = false;
      selectedCategory = categories[0];
    });
    return categoryLoading;
  }

  Future<bool> getAllFacility() async {
    setState(() {
      facilityLoading = true;
    });
    final response = await widget._facilityRepository
        .getAllPublicFacility(FacilityParams(categoryId: selectedCategory.id));
    setState(() {
      facilityLoading = false;
      facilities = response.data as List<Facility>;
    });
    return facilityLoading;
  }

  @override
  void initState() {
    getAllCategory();
    getAllFacility();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = FacilitiesPage.routeName;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Tag(
                  title: tr(title),
                  icon: Icons.grid_view,
                  type: TagType.transparent,
                  textStyle: Theme.of(context).textTheme.headline2,
                  padding: const EdgeInsets.symmetric(horizontal: 0.1),
                ),
                Button(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  size: ButtonSize.medium,
                  onPressed: () {
                    homeNavigator.currentState
                        ?.pushNamed(FacilityDetailPage.routeName);
                  },
                  label: tr("Search from area"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          CategoryTabBar<Category>(
            itemKey: "name",
            tabs: categories,
            onTap: (value) {
              setState(() {
                selectedCategory = value;
              });
              getAllFacility();
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                bool loading = await getAllCategory();
                loading = await getAllFacility();
                return Future.value(loading);
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
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
