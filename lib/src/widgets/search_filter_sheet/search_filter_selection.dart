// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:collection';

import 'search_filter_term.dart';

class AkoSearchFilterSelection {
  String label;
  Map<int, String> selectionOptions;
  Map<int, AkoSearchFilterTerm> selectionTerms;
  List<int> selectedOptions;
  Map<int, AkoSearchFilterTerm> selectedTerms;

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
