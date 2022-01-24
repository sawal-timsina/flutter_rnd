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
import 'package:watamuki/src/presentation/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/list_item.dart';
import 'package:watamuki/src/presentation/widgets/molecules/title_bar.dart';

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
  List<Category> categories = [];

  Category selectedCategory = Category(id: 0, name: "");

  Future<bool> getAllCategory() async {
    final response = await widget._categoryRepository.getAllPublicCategory(
        CategoryParams(type: CategoryType.facility.value));
    setState(() {
      categories = response.data as List<Category>;
      if (selectedCategory.id == 0) {
        selectedCategory = categories[0];
      }
    });
    return true;
  }

  List<Facility> facilities = [];

  Future<bool> getAllFacility() async {
    final response = await widget._facilityRepository.getAllPublicFacility(
      FacilityParams(categoryId: selectedCategory.id),
    );
    setState(() {
      facilities = response.data as List<Facility>;
    });
    return true;
  }

  Future<bool> refresh() async {
    bool loading = await getAllCategory();
    loading = await getAllFacility();
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
    String title = FacilitiesPage.routeName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBar(title: tr(title), icon: Icons.grid_view),
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
              getAllFacility();
            },
          ),
        if (facilities.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
