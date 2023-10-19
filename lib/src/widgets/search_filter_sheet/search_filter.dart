import 'package:flutter/material.dart';

import 'search_filter_options.dart';
import 'search_filter_sheet.dart';

export 'search_filter_options.dart';
export 'search_filter_selection.dart';
export 'search_filter_sheet.dart';
export 'search_filter_style.dart';
export 'search_filter_term.dart';

class AkoSearchFilter {
  AkoSearchFilterOptions options;
  AkoSearchFilter({required this.options});

  Future<T?> showBottomSheet<T>(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: options.style.bottomSheetShape,
      backgroundColor: options.style.bottomSheetBackgroundColor,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AkoSearchFilterSheet(
              options: options,
            );
          },
        );
      },
    );
  }
}
