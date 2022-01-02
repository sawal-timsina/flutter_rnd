import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/molecules/bottom_nav_bar.dart';
import 'package:watamuki/src/presentation/widgets/molecules/header.dart';
import 'package:watamuki/src/presentation/widgets/organisms/custom_drawer.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonSize _buttonSize = ButtonSize.small;
  ButtonType _buttonType = ButtonType.filled;
  bool _isDisabled = false;

  void _toggleButtonSize() {
    setState(() {
      _buttonSize = _buttonSize == ButtonSize.large
          ? ButtonSize.medium
          : _buttonSize == ButtonSize.medium
              ? ButtonSize.small
              : ButtonSize.large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: () {
                // Navigator.pushNamed(context, "/login");
              },
              label: 'Login',
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              label: "Register",
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: _toggleButtonSize,
              label: "Size",
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: () {
                setState(() {
                  _buttonType = ButtonType.filled;
                });
              },
              label: "Filled",
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: () {
                setState(() {
                  _buttonType = ButtonType.outlined;
                });
              },
              label: "Outlined",
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              disabled: _isDisabled,
              onPressed: () {
                setState(() {
                  _buttonType = ButtonType.transparent;
                });
              },
              label: "Transparent",
            ),
            const SizedBox(height: 16),
            Button(
              size: _buttonSize,
              type: _buttonType,
              onPressed: () {
                setState(() {
                  _isDisabled = !_isDisabled;
                });
              },
              label: "Disable",
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
