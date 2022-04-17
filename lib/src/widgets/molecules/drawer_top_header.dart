import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        CrossAxisAlignment,
        Divider,
        Key,
        Navigator,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:provider/provider.dart' show Consumer;

import '../../config/themes/colors.dart';
import '../../pages/auth/login.dart';
import '../../providers/auth_provider.dart';
import '../atoms/button.dart';

class DrawerTopHeader extends StatelessWidget {
  const DrawerTopHeader({
    Key? key,
  }) : super(key: key);

  List<Widget> _renderDefaultView(BuildContext context) {
    return [
      Text(
        "Please login / register",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 32),
      Text(
        "If you have not registered,\nplease register as a member here.",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 24),
      Button(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "register");
          },
          label: "Register"),
      const SizedBox(height: 16),
      const Divider(color: AppColors.greyDark),
      const SizedBox(height: 16),
      Text(
        "If you already have an account,\nplease log in as a member here.",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 24),
      Button(
          type: ButtonType.outlined,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, LoginPage.routeName);
          },
          label: 'Login'),
      const SizedBox(height: 16),
      const Divider(color: AppColors.greyDark),
    ];
  }

  List<Widget> _renderAuthView(BuildContext context, String? name) {
    return [
      const SizedBox(height: 8),
      Text(
        "$name",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 16),
      const Divider(color: AppColors.greyDark),
    ];
  }

  Widget _columnViewRender(List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return value.loggedIn
            ? _columnViewRender(
                _renderAuthView(context, value.dbUser?.nickName))
            : _columnViewRender(_renderDefaultView(context));
      },
    );
  }
}
