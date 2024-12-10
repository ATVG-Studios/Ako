// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

typedef AkoSearchFilterTermLoader = Future<List<AkoSearchFilterTerm>>
    Function();

/// AkoSearchFilterTerm defines a Term that can be filtered, terms are passed to [AkoSearchSelectionSheet]
class AkoSearchFilterTerm {
  final int id;
  final String name;
  final String value;
  final String category;

  AkoSearchFilterTerm(this.id, this.name, this.value, this.category);

  @override
  String toString() {
    return 'AkoSearchFilterTerm{id: $id, name: $name, value: $value, category: $category}';
  }

  static newSimple(int id, String name) {
    return AkoSearchFilterTerm(id, name, name, name);
  }

  static forList(String category, List<String> items, {int startId = 1}) {
    List<AkoSearchFilterTerm> list = [];
    for (final item in items) {
      list.add(AkoSearchFilterTerm(
          startId + list.length, item, item.toLowerCase(), category));
    }
    return list;
  }
}
