import 'package:watamuki/src/core/resources/data_response.dart';
import 'package:watamuki/src/core/resources/list_response.dart';
import 'package:watamuki/src/core/utils/json_serializable_converter.dart';
import 'package:watamuki/src/data/models/category/category.dart';
import 'package:watamuki/src/data/models/facility/facility.dart';
import 'package:watamuki/src/data/models/user/user.dart';

class JsonConverters {
  // callable class, so that we don't have to make a messy class object and call getter
  // we can just JsonConverters()() -> boom!!, you looking for this
  JsonSerializableConverter call() {
    return JsonSerializableConverter({
      DataResponse<User>: (json) =>
          DataResponse<User>.fromJson(json, User.fromJson),
      ListResponse<List<Facility>>: (json) =>
          ListResponse<List<Facility>>.fromJson(json, (json) {
            return json.map((e) => Facility.fromJson(e)).toList();
          }),
      ListResponse<List<Category>>: (json) =>
          ListResponse<List<Category>>.fromJson(json, (json) {
            return json.map((e) => Category.fromJson(e)).toList();
          }),
    });
  }
}
