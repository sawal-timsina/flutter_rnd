import 'package:flutter/material.dart'
    show
        Axis,
        BuildContext,
        Canvas,
        ClipPath,
        Color,
        Colors,
        Container,
        CustomClipper,
        CustomPaint,
        CustomPainter,
        EdgeInsets,
        Flex,
        FontWeight,
        GlobalKey,
        Key,
        MediaQuery,
        Offset,
        Padding,
        Paint,
        Path,
        RRect,
        Radius,
        Rect,
        Size,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        WidgetsBinding;

class CouponView extends StatefulWidget {
  final Axis axis;
  final Size arcSize;

  final Color backgroundColor;

  final EdgeInsets padding;

  final Color dividerColor;

  final double borderRadius;

  // shadow
  final double? elevation;

  final Color? shadowColor;

  final Widget leading;

  final Widget trailing;

  const CouponView({
    Key? key,
    this.axis = Axis.horizontal,
    this.arcSize = const Size(20, 10),
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(25),
    this.dividerColor = Colors.grey,
    this.borderRadius = 4,
    this.elevation,
    this.shadowColor,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  State<CouponView> createState() => _CouponViewState();
}

class _CouponViewState extends State<CouponView> {
  GlobalKey cKey = GlobalKey();
  double _pos = 0.0;

  @override
  void initState() {
    _onResize();
    super.initState();
  }

  void _onResize() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (context.size is Size && _pos == 0.0) {
        setState(() {
          _pos = (cKey.currentContext
                      ?.findRenderObject()
                      ?.paintBounds
                      .size
                      .height ??
                  0.0) +
              12;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CouponViewPainter(
        widget.axis,
        widget.arcSize,
        _pos,
        widget.backgroundColor,
        widget.padding,
        widget.dividerColor,
        widget.borderRadius,
        widget.elevation,
        widget.shadowColor,
      ),
      child: Container(
        padding: widget.padding,
        child: ClipPath(
          clipper: CouponViewClipper(
              widget.axis, widget.arcSize, _pos, widget.borderRadius),
          child: Flex(
            direction: widget.axis,
            children: [
              SizedBox(
                key: cKey,
                child: widget.leading,
              ),
              SizedBox(
                height:
                    widget.axis == Axis.vertical ? widget.arcSize.height : null,
                width: widget.axis == Axis.horizontal
                    ? widget.arcSize.width
                    : null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.arcSize.width / 1.5),
                  child: Text(
                    " -" *
                        (MediaQuery.of(context).size.width /
                                MediaQuery.of(context).devicePixelRatio)
                            .toInt(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.dividerColor),
                  ),
                ),
              ),
              SizedBox(
                child: widget.trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CouponViewPainter extends CustomPainter {
  final Axis axis;
  final Size arcSize;
  final double trianglePos;

  final Color backgroundColor;

  final EdgeInsets padding;

  final Color dividerColor;

  final double borderRadius;

  final double? elevation;

  final Color? shadowColor;
  Offset dashStart = const Offset(0.0, 0.0), dashEnd = const Offset(0.0, 0.0);

  CouponViewPainter(
    this.axis,
    this.arcSize,
    this.trianglePos,
    this.backgroundColor,
    this.padding,
    this.dividerColor,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    //Get Background Rect
    Paint paint = Paint();

    //Get foreground Rect
    paint.color = backgroundColor;
    // paint.color = Colors.transparent;
    Rect _foregroundRect = Rect.fromLTRB(padding.left, padding.top,
        size.width - padding.right, size.height - padding.bottom);

    RRect foregroundRect =
        RRect.fromRectAndRadius(_foregroundRect, Radius.circular(borderRadius));

    //Clip the triangle or Arc
    Path path = Path();

    path.moveTo(foregroundRect.left, foregroundRect.top);

    if (axis == Axis.horizontal) {
      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.left, foregroundRect.top),
        Offset(foregroundRect.right, foregroundRect.top),
        trianglePos,
        arcSize,
      );

      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.right, foregroundRect.bottom),
        Offset(foregroundRect.left, foregroundRect.bottom),
        trianglePos,
        arcSize,
      );
    } else {
      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.right, foregroundRect.top),
        Offset(foregroundRect.right, foregroundRect.bottom),
        trianglePos,
        arcSize,
      );

      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.left, foregroundRect.bottom),
        Offset(foregroundRect.left, foregroundRect.top),
        trianglePos,
        arcSize,
      );
    }

    canvas.drawShadow(
        path, shadowColor ?? const Color(0xFFF3F4F8), elevation ?? 0, true);

    canvas.clipPath(path);

    canvas.drawRRect(foregroundRect, paint);
  }

  void _addTrianglePointToPath(RRect size, Path path, Offset start, Offset end,
      double trianglePos, Size arcSize) {
    if (start.dy == end.dy) {
      //Draw Horizontal Triangle

      if (end.dx > start.dx) {
        path.lineTo(start.dx, start.dy);
        path.lineTo(start.dx + (size.width * trianglePos) - arcSize.width / 2,
            start.dy);
        path.arcToPoint(
            Offset(start.dx + (size.width * trianglePos) + arcSize.width / 2,
                start.dy),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);
        path.lineTo(end.dx, end.dy);
        return;
      } else {
        path.lineTo(start.dx, start.dy);
        path.lineTo(
            end.dx + (size.width * trianglePos) + arcSize.width / 2, end.dy);
        path.arcToPoint(
            Offset(end.dx + (size.width * trianglePos) - arcSize.width / 2,
                end.dy),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);
        path.lineTo(end.dx, end.dy);
        return;
      }
    } else if (start.dx == end.dx) {
      //Draw Vertical Triangle
      if (end.dy > start.dy) {
        path.lineTo(start.dx - borderRadius, start.dy);

        path.arcToPoint(Offset(start.dx, start.dy + borderRadius),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(start.dx, start.dy + (trianglePos) - arcSize.width / 2);

        path.arcToPoint(
            Offset(start.dx, start.dy + (trianglePos) + arcSize.width / 2),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);

        path.lineTo(end.dx, end.dy - borderRadius);

        path.arcToPoint(Offset(end.dx - borderRadius, end.dy),
            radius: Radius.circular(borderRadius), clockwise: true);
        return;
      } else {
        path.lineTo(start.dx + borderRadius, start.dy);

        path.arcToPoint(Offset(start.dx, start.dy - borderRadius),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(end.dx, end.dy + (trianglePos) + arcSize.width / 2);

        path.arcToPoint(
            Offset(end.dx, end.dy + (trianglePos) - arcSize.width / 2),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);

        path.lineTo(end.dx, end.dy + borderRadius);

        path.arcToPoint(Offset(end.dx + borderRadius, end.dy),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(end.dx + borderRadius, end.dy);
        return;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CouponViewClipper extends CustomClipper<Path> {
  final Axis axis;
  final Size arcSize;
  final double trianglePos;

  final double borderRadius;

  CouponViewClipper(
    this.axis,
    this.arcSize,
    this.trianglePos,
    this.borderRadius,
  );

  @override
  Path getClip(Size size) {
    Path path = Path();

    Rect _foregroundRect = Rect.fromLTRB(0, 0, size.width, size.height);

    RRect foregroundRect =
        RRect.fromRectAndRadius(_foregroundRect, Radius.circular(borderRadius));

    path.moveTo(foregroundRect.left, foregroundRect.top);

    if (axis == Axis.horizontal) {
      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.left, foregroundRect.top),
        Offset(foregroundRect.right, foregroundRect.top),
        trianglePos,
        arcSize,
      );

      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.right, foregroundRect.bottom),
        Offset(foregroundRect.left, foregroundRect.bottom),
        trianglePos,
        arcSize,
      );
    } else {
      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.right, foregroundRect.top),
        Offset(foregroundRect.right, foregroundRect.bottom),
        trianglePos,
        arcSize,
      );

      _addTrianglePointToPath(
        foregroundRect,
        path,
        Offset(foregroundRect.left, foregroundRect.bottom),
        Offset(foregroundRect.left, foregroundRect.top),
        trianglePos,
        arcSize,
      );
    }

    return path;
  }

  void _addTrianglePointToPath(RRect size, Path path, Offset start, Offset end,
      double trianglePos, Size arcSize) {
    if (start.dy == end.dy) {
      //Draw Horizontal Triangle

      if (end.dx > start.dx) {
        path.lineTo(start.dx, start.dy);
        path.lineTo(start.dx + (size.width * trianglePos) - arcSize.width / 2,
            start.dy);
        path.arcToPoint(
            Offset(start.dx + (size.width * trianglePos) + arcSize.width / 2,
                start.dy),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);
        path.lineTo(end.dx, end.dy);
        return;
      } else {
        path.lineTo(start.dx, start.dy);

        path.arcToPoint(Offset(start.dx, start.dy - borderRadius),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(
            end.dx + (size.width * trianglePos) + arcSize.width / 2, end.dy);

        path.arcToPoint(
            Offset(end.dx + (size.width * trianglePos) - arcSize.width / 2,
                end.dy),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);

        path.lineTo(end.dx, end.dy);
        return;
      }
    } else if (start.dx == end.dx) {
      //Draw Vertical Triangle
      if (end.dy > start.dy) {
        path.lineTo(start.dx - borderRadius, start.dy);

        path.arcToPoint(Offset(start.dx, start.dy + borderRadius),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) - arcSize.width / 2);

        path.arcToPoint(
            Offset(start.dx,
                start.dy + (size.height * trianglePos) + arcSize.width / 2),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);

        path.lineTo(end.dx, end.dy - borderRadius);

        path.arcToPoint(Offset(end.dx - borderRadius, end.dy),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(end.dx + borderRadius, end.dy);
        return;
      } else {
        path.lineTo(start.dx + borderRadius, start.dy);

        path.arcToPoint(Offset(start.dx, start.dy - borderRadius),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(
            end.dx, end.dy + (size.height * trianglePos) + arcSize.width / 2);

        path.arcToPoint(
            Offset(end.dx,
                end.dy + (size.height * trianglePos) - arcSize.width / 2),
            radius: Radius.circular(arcSize.width / 2),
            clockwise: false);

        path.lineTo(end.dx, end.dy + borderRadius);

        path.arcToPoint(Offset(end.dx + borderRadius, end.dy),
            radius: Radius.circular(borderRadius), clockwise: true);

        path.lineTo(end.dx + borderRadius, end.dy);
        return;
      }
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
