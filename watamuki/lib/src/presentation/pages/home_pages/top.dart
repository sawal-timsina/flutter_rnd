import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/home_pages/special_feature.dart';
import 'package:watamuki/src/presentation/pages/home_pages/town_information.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

import 'home_navigator.dart';

class TopPage extends StatefulWidget {
  static const routeName = 'top';

  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage>
    with AutomaticKeepAliveClientMixin<TopPage> {
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
    super.build(context);
    return Center(
      child: ListView(
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
          ),
          const SizedBox(height: 16),
          Button(
            size: _buttonSize,
            type: _buttonType,
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(SpecialFeaturePage.routeName);
            },
            label: "Disable second last",
          ),
          const SizedBox(height: 16),
          Button(
            size: _buttonSize,
            type: _buttonType,
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInformationPage.routeName);
            },
            label: "Disable last",
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
