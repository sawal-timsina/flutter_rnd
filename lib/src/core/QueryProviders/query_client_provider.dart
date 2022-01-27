import 'package:flutter/cupertino.dart';
import 'package:watamuki/src/core/QueryProviders/Converters/converter.dart';
import 'package:watamuki/src/core/QueryProviders/query_injectors.dart';

class QueryClientProvider extends StatelessWidget {
  final Converter converter;
  final Widget child;

  QueryClientProvider({Key? key, required this.converter, required this.child})
      : super(key: key) {
    initDependency(converter: converter);
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
