import 'package:query_provider/converters/converter.dart';
import 'package:query_provider/converters/json_converter.dart';

import '../../models/category/category.dart';
import '../../models/coupon/coupon.dart';
import '../../models/facility/facility.dart';
import '../../models/user/user.dart';

class JsonFactory {
  ResponseConverter call() {
    return JsonResponseConverter(
      {
        User: (json) => User.fromJson(json),
        Category: (json) => Category.fromJson(json),
        Coupon: (json) => Coupon.fromJson(json),
        Facility: (json) => Facility.fromJson(json),
      },
      {
        List<Category>: (list) {
          return [for (final v in list) Category.fromJson(v)];
        },
        List<Facility>: (list) {
          return [for (final v in list) Facility.fromJson(v)];
        },
        List<Coupon>: (list) {
          return [for (final v in list) Coupon.fromJson(v)];
        },
      },
    );
  }
}
