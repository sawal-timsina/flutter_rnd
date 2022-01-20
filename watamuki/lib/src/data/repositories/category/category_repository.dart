import 'package:watamuki/src/core/resources/data_state.dart';
import 'package:watamuki/src/data/models/category/category.dart';

abstract class CategoryRepository {
  Future<DataState<List<Category>>> getAllPublicCategory();
}
