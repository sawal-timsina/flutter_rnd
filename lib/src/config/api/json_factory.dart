import 'package:watamuki/src/core/utils/json_serializable_converter.dart';
import 'package:watamuki/src/models/category/category.dart';
import 'package:watamuki/src/models/facility/facility.dart';
import 'package:watamuki/src/models/user/user.dart';

final jsonFactory = JsonConverter({
  Category: (json) => Category.fromJson(json),
  User: (json) => User.fromJson(json),
}, {
  List<Category>: (list) {
    return [for (final v in list) Category.fromJson(v)];
  },
  List<Facility>: (list) {
    return [for (final v in list) Facility.fromJson(v)];
  },
});
