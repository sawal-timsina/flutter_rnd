import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/presentation/widgets/atoms/drawer_items.dart';
import 'package:watamuki/src/presentation/widgets/molecules/drawer_top_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  List<Widget> _renderDefaultMenus() {
    return [
      const DrawerItem(
        icon: Icons.help_outline_rounded,
        title: "Inquiry",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "About",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Terms and Conditions",
      ),
      const DrawerItem(
        icon: Icons.local_police_outlined,
        title: "Privacy Policy",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Extra",
      ),
    ];
  }

  List<Widget> _renderAuthMenus() {
    return [
      const DrawerItem(
        icon: Icons.help_outline_rounded,
        title: "Update Profile",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update mobile number",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update password",
      ),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update email",
      ),
    ];
  }

  List<Widget> _renderAuthMenusFooter() {
    return [
      const SizedBox(height: 8),
      const Divider(color: AppColors.greyDark),
      const SizedBox(height: 8),
      const DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Logout",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.horizontal(right: Radius.circular(32.0)),
        child: Container(
          constraints: BoxConstraints.tight(
              Size(SizerUtil.width - 72, SizerUtil.height)),
          child: Drawer(
            child: SafeArea(
                child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    children: <Widget>[
                      const DrawerTopHeader(),
                      ...(kDebugMode ? _renderAuthMenus() : []),
                      ..._renderDefaultMenus(),
                      ...(kDebugMode ? _renderAuthMenusFooter() : []),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        size: 48,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Watamuki",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
