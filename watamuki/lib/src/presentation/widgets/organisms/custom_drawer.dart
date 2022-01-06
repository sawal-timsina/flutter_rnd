import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/config/firebase/firebase.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/presentation/pages/demo.dart';
import 'package:watamuki/src/presentation/providers/auth_provider.dart';
import 'package:watamuki/src/presentation/widgets/atoms/drawer_items.dart';
import 'package:watamuki/src/presentation/widgets/molecules/drawer_top_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  List<Widget> _renderDefaultMenus(BuildContext context) {
    return [
      DrawerItem(
        icon: Icons.help_outline_rounded,
        title: "Inquiry",
        onTap: () {
          Navigator.pushNamed(context, "inquiry",
              arguments: DemoScreenArguments("+9779810479442"));
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "About",
        onTap: () {
          Navigator.pushNamed(context, "about");
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Terms and Conditions",
        onTap: () {
          Navigator.pushNamed(context, "terms_and_condition");
        },
      ),
      DrawerItem(
        icon: Icons.local_police_outlined,
        title: "Privacy Policy",
        onTap: () {
          Navigator.pushNamed(context, "privacy_policy");
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Extra",
        onTap: () {
          Navigator.pushNamed(context, "extra");
        },
      ),
    ];
  }

  List<Widget> _renderAuthMenus(BuildContext context) {
    return [
      DrawerItem(
        icon: Icons.help_outline_rounded,
        title: "Update Profile",
        onTap: () {
          Navigator.pushNamed(context, "update_profile");
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update mobile number",
        onTap: () {
          Navigator.pushNamed(context, "update_mobile");
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update password",
        onTap: () {
          Navigator.pushNamed(context, "update_password");
        },
      ),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Update email",
        onTap: () {
          Navigator.pushNamed(context, "update_email");
        },
      ),
    ];
  }

  List<Widget> _renderAuthMenusFooter() {
    return [
      const SizedBox(height: 8),
      const Divider(color: AppColors.greyDark),
      const SizedBox(height: 8),
      DrawerItem(
        icon: Icons.info_outline_rounded,
        title: "Logout",
        onTap: () {
          firebaseAuth.signOut();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: defaultTargetPlatform != TargetPlatform.iOS,
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
                          Consumer<AuthProvider>(builder: (context, value, child) {
                            return value.loggedIn
                                ? Column(children: _renderAuthMenus(context))
                                : const SizedBox.shrink();
                          }),
                          ..._renderDefaultMenus(context),
                          Consumer<AuthProvider>(builder: (context, value, child) {
                            return value.loggedIn
                                ? Column(children: _renderAuthMenusFooter())
                                : const SizedBox.shrink();
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: defaultTargetPlatform == TargetPlatform.iOS
                          ? const EdgeInsets.only(top: 16, left: 24, right: 24)
                          : const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: Row(
                        children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        size: 48,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        tr("Watamuki"),
                        style: Theme.of(context).textTheme.headline2,
                      ),
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
