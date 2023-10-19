import 'dart:collection';

import 'search_filter_term.dart';

class AkoSearchFilterSelection {
  String label;
  HashMap<int, String> selectionOptions;
  HashMap<int, AkoSearchFilterTerm> selectionTerms;
  List<int> selectedOptions;
  List<AkoSearchFilterTerm> selectedTerms;

  AkoSearchFilterTermLoader? fetchTerms;
  Function(List<int>)? onSelectionChanged;
  Function(List<AkoSearchFilterTerm>)? onTermsChanged;

  AkoSearchFilterSelection({
    required this.label,
    required this.selectionOptions,
    required this.selectionTerms,
    required this.selectedOptions,
    required this.selectedTerms,
    this.fetchTerms,
    this.onSelectionChanged,
    this.onTermsChanged,
  }) {
    // Assert that either fetchOptions or selectionOptions is not null/empty.
    assert(fetchTerms != null);
  }
}
