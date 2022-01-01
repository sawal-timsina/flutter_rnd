import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

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
            Navigator.pushNamed(context, "/register");
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
            Navigator.pushNamed(context, "/login");
          },
          label: 'Login'),
      const SizedBox(height: 16),
      const Divider(color: AppColors.greyDark),
    ];
  }

  List<Widget> _renderAuthView(BuildContext context) {
    return [
      Text(
        "Sawal timsina",
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const SizedBox(height: 8),
      const Divider(color: AppColors.greyDark),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            kDebugMode ? _renderDefaultView(context) : _renderAuthView(context),
      ),
    );
  }
}
