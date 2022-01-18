import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/atoms/tag.dart';
import 'package:watamuki/src/presentation/widgets/molecules/category_tab_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/list_item.dart';

import 'facility_detail.dart';
import 'home_navigator.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'facilities';

  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with AutomaticKeepAliveClientMixin<FacilitiesPage> {
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
          CategoryTabBar<Map>(
            itemKey: "name",
            tabs: const [
              {"name": "Cat1"},
              {"name": "Cat2"},
              {"name": "Cat3"},
            ],
            onTap: (value) {
              print(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  title: "日野の歴史ある名所」を巡るサイクリングスタンプラリーを開催します！",
                  subTitle: "日野の歴史ある名所」を巡るサイクリングスタンプラリーを開催します！",
                  imageSrc:
                      "https://storage.googleapis.com/watamuki-development/images/original/1640347742921780511.jpg",
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
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
