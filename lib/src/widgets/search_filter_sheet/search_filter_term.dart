typedef AkoSearchFilterTermLoader = Future<List<AkoSearchFilterTerm>>
    Function();

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
