import 'package:watamuki/src/core/QueryProviders/Converters/json_converter.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/coupon/index.dart';
import 'package:watamuki/src/models/facility/facility.dart';
import 'package:watamuki/src/models/user/user.dart';

final jsonFactory = JsonConverter({
  User: (json) => User.fromJson(json),
  Category: (json) => Category.fromJson(json),
  Coupon: (json) => Coupon.fromJson(json),
  Facility: (json) => Facility.fromJson(json),
}, {
  List<Category>: (list) {
    return [for (final v in list) Category.fromJson(v)];
  },
  List<Facility>: (list) {
    return [for (final v in list) Facility.fromJson(v)];
  },
  List<Coupon>: (list) {
    return [for (final v in list) Coupon.fromJson(v)];
  },
});
