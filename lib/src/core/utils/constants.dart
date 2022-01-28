import 'package:flutter/material.dart';

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
  if (list.isEmpty) return true;

  var flag = _isList(list[0]);
  var length = flag ? list[0].length : 0;
  for (var i = 0; i < list.length; i++) {
    var tempFlag = _isList(list[i]);
    var tempLength = tempFlag ? list[i].length : 0;
    if (flag != tempFlag || length != tempLength) return false;
  }
  return true;
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
