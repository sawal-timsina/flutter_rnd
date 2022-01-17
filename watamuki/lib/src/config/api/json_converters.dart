import 'package:watamuki/src/core/utils/json_serializable_converter.dart';
import 'package:watamuki/src/data/models/responses/data_response_modal.dart';
import 'package:watamuki/src/data/models/user_modal.dart';

class JsonConverters {
  // callable class, so that we don't have to make a messy class object and call getter
  // we can just JsonConverters()() -> boom!!, you looking for this
  JsonSerializableConverter call() {
    return JsonSerializableConverter({
      DataResponse<UserModal>: (json) =>
          DataResponse<UserModal>.fromJson(json, UserModal.fromJson),
    });
  }
}
