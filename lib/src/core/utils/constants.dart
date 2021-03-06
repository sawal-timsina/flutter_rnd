import 'package:flutter/material.dart' show EdgeInsets;

import '../../models/optionItem/index.dart';

class Constants {
  static const pageSize = 15;
}

extension Merge on EdgeInsets {
  EdgeInsets merge(EdgeInsets? other) {
    return copyWith(
      left: other?.left != 0 ? other?.left : left,
      right: other?.right != 0 ? other?.right : right,
      top: other?.top != 0 ? other?.top : top,
      bottom: other?.bottom != 0 ? other?.bottom : bottom,
    );
  }
}

bool _isList(list) => list is List;

bool _checkArray(List list) {
  bool isAllList = false;
  for (var i = 0; i < list.length; i++) {
    isAllList = _isList(list[i]);
  }
  return isAllList;
}

extension Flatten on List {
  List flatten() {
    final _shapeCheck = _checkArray(this);
    if (!_shapeCheck) throw Exception('Uneven array dimension');
    var result = [];
    for (var i = 0; i < length; i++) {
      for (var j = 0; j < this[i].length; j++) {
        result.add(this[i][j]);
      }
    }
    return result;
  }
}

final List<OptionItem> ages = [
  OptionItem(
    title: "10代以下",
    value: "10代以下",
  ),
  OptionItem(
    title: "20代",
    value: "20代",
  ),
  OptionItem(
    title: "30代",
    value: "30代",
  ),
  OptionItem(
    title: "40代",
    value: "40代",
  ),
  OptionItem(
    title: "50代",
    value: "50代",
  ),
  OptionItem(
    title: "60代",
    value: "60代",
  ),
  OptionItem(
    title: "70代",
    value: "70代",
  ),
  OptionItem(
    title: "80代以上",
    value: "80代以上",
  )
];
