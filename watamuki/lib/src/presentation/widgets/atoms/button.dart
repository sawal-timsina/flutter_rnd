import 'package:flutter/material.dart';
import 'package:watamuki/src/config/themes/colors.dart';

enum ButtonType {
  filled,
  outlined,
  transparent,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class Button extends StatefulWidget {
  final String label;
  final Icon? icon;
  final GestureTapCallback onPressed;
  final ButtonType? type;
  final ButtonSize? size;
  final bool? disabled;
  final bool disableBorder;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const Button({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.type = ButtonType.filled,
    this.size = ButtonSize.large,
    this.disabled = false,
    this.textStyle,
    this.padding,
    this.disableBorder = false,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late double _sizeValue;

  @override
  void initState() {
    super.initState();
    setState(() {
      _sizeValue = widget.size == ButtonSize.small
          ? 8
          : widget.size == ButtonSize.medium
              ? 12
              : 16;
    });
  }

  @override
  void didUpdateWidget(covariant Button oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sizeValue = widget.size == ButtonSize.small
        ? 8
        : widget.size == ButtonSize.medium
            ? 12
            : 16;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: widget.disabled! ? null : widget.onPressed,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      padding: widget.padding ??
          EdgeInsets.symmetric(vertical: _sizeValue, horizontal: _sizeValue),
      textStyle: (widget.size == ButtonSize.large
              ? Theme.of(context).textTheme.button
              : widget.size == ButtonSize.medium
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context).textTheme.bodyText1)
          ?.merge(
            TextStyle(
              color: widget.disabled!
                  ? Colors.white
                  : widget.type == ButtonType.filled
                      ? Colors.white
                      : widget.type == ButtonType.outlined
                          ? Colors.green
                          : Colors.black87,
            ),
          )
          .merge(widget.textStyle),
      splashColor: widget.type == ButtonType.filled
          ? Theme.of(context).primaryColorDark
          : widget.type == ButtonType.outlined
              ? Theme.of(context).primaryColorLight
              : null,
      fillColor: widget.disabled!
          ? AppColors.greyDark
          : widget.type == ButtonType.filled
              ? Theme.of(context).primaryColor
              : null,
      shape: RoundedRectangleBorder(
        side: widget.disabled! || widget.type != ButtonType.outlined
            ? BorderSide.none
            : BorderSide(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.all(
            Radius.circular(widget.disableBorder ? 0 : _sizeValue)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...(widget.icon != null
              ? [widget.icon!, const SizedBox(width: 8)]
              : []),
          Text(widget.label),
        ],
      ),
    );
  }
}