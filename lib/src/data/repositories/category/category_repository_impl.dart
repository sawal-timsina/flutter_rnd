import 'dart:io';

import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/data_sources/remote/category/category_service.dart';
import 'package:watamuki/src/data/models/category/category.dart';
import 'package:watamuki/src/data/repositories/category/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryService categoryService = kAPI.getService<CategoryService>();

  @override
  Future<ApiResponse<List<Category>>> getAllPublicCategory(params) async {
    try {
      final response = await categoryService.getAllCategory(type: params.type);

      if (response.statusCode != HttpStatus.ok) {
        return ErrorResponse(response.bodyString);
      }

      return SuccessResponse<List<Category>>(
          response.body?.data as List<Category>);
    } on HttpException catch (e) {
      return ErrorResponse(e.message);
    }
  }
}
