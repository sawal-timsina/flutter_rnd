/// Generated by Flutter GetX Starter on 2021-12-28 22:41
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class R {
  /// This `R.image` struct is generated, and contains static references to static image asset resources.
  static const String package = null;
  static const icon = _R_Icon();
}

extension StringExtension on String {
  Widget toImage({
    Key key,
    double scale,
    double width,
    double height,
    Color color,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    String package = R.package,
  }) {
    if (this.endsWith(".svg")) {
      return SvgPicture.asset(
        this,
        key: key,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
        package: package,
      );
    } else {
      return Image.asset(
        this,
        key: key,
        scale: scale,
        width: width,
        height: height,
        color: color,
        fit: fit,
        alignment: alignment,
        package: package,
      );
    }
  }

  Widget toLottie({
    Key key,
    double width,
    double height,
    String package = R.package,
    BoxFit fit = BoxFit.contain,
    Animation<double> controller,
    Function(LottieComposition) onLoaded,
    Alignment alignment = Alignment.center,
  }) {
    return Lottie.asset(
      this,
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      controller: controller,
      onLoaded: onLoaded,
      package: package,
    );
  }

  Icon toIcon({
    Key key,
    double size,
    Color color,
    String family = "iconfont",
    String package = R.package,
  }) {
    return Icon(
      IconData(
        int.parse(this),
        fontFamily: family,
        fontPackage: package,
      ),
      size: size,
      color: color,
    );
  }
}

class _R_Icon {
  const _R_Icon();
}
