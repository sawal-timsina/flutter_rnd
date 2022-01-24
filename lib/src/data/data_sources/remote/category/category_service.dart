import 'package:chopper/chopper.dart';
import 'package:watamuki/src/core/resources/list_response.dart';
import 'package:watamuki/src/data/models/category/category.dart';

part 'category_service.chopper.dart';

@ChopperApi(baseUrl: "/categories")
abstract class CategoryService extends ChopperService {
  static CategoryService create([ChopperClient? client]) =>
      _$CategoryService(client);

  @Get(path: "/public")
  Future<Response<ListResponse<List<Category>>>> getAllCategory(
      @QueryMap() Map<String, dynamic> query);
}
