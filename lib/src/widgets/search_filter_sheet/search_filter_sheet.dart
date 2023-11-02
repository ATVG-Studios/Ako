// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako/ako.dart';
import 'package:flutter/material.dart';

class AkoSearchFilterSheet extends StatefulWidget {
  const AkoSearchFilterSheet({super.key, required this.options});

  final AkoSearchFilterOptions options;

  @override
  State<AkoSearchFilterSheet> createState() => _AkoSearchFilterSheetState();
}

class _AkoSearchFilterSheetState extends State<AkoSearchFilterSheet> {
  void _clearSelection() {
    if (widget.options.onFilterUpdated != null) {
      widget.options.onFilterUpdated!();
    }
    setState(() {
      for (final selection in widget.options.filterSelections) {
        selection.selectedTerms.clear();
        selection.selectedOptions.clear();
      }
    });
  }

  void _applySelection() {
    _emitSelectionChanged();
    _closeSelection();
  }

  void _closeSelection() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _emitSelectionChanged() {
    if (widget.options.onFilterUpdated != null) {
      widget.options.onFilterUpdated!();
    }
    for (final selection in widget.options.filterSelections) {
      if (selection.onTermsChanged != null) {
        selection.onTermsChanged!(selection.selectedTerms.values.toList());
      }
      if (selection.onSelectionChanged != null) {
        selection.onSelectionChanged!(selection.selectedOptions);
      }
    }
  }

  Widget _buildFilterWidget(AkoSearchFilterSelection selection) {
    List<AkoBadgeLabel> selectedLabels = [];

    for (final term in selection.selectedTerms.values) {
      selectedLabels.add(AkoBadgeLabel(label: term.name));
    }

    return GestureDetector(
      onTap: () async {
        await AkoSearchSelection(
          options: AkoSearchSelectionOptions(
            options: selection.selectionOptions,
            selectedOptions:
                selection.selectedTerms.entries.map((e) => e.key).toList(),
            onSelectionChanged: (selectedList) {
              selection.selectedOptions.clear();
              selection.selectedOptions.addAll(selectedList);
              selection.selectedTerms.clear();
              for (final id in selectedList) {
                if (selection.selectionTerms.containsKey(id)) {
                  selection.selectedTerms[id] = selection.selectionTerms[id]!;
                }
              }
              // _dispatchOnInput();
            },
            customFieldOptions: widget.options.customFieldOptions,
            customStyle: AkoSearchSelectionStyle(
              submitButtonStyle: widget.options.style.submitButtonStyle,
            ),
            bottomSheetTitle: widget.options.bottomSheetTitle,
            submitButtonText: widget.options.submitButtonText,
            clearButtonText: widget.options.clearButtonText,
          ),
        ).showBottomSheet(context);
        _emitSelectionChanged();
        setState(() {
          selectedLabels.clear();
          for (final term in selection.selectedTerms.values) {
            selectedLabels.add(AkoBadgeLabel(label: term.name));
          }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selection.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          AkoBadge(
            style: AkoBadgeStyle(
              largeSize: 26,
              backgroundColor: widget.options.style.badgeBackgroundColor
            ),
            labelsFuture: Future.value(selectedLabels),
            withNoData: (context) => SizedBox.shrink(),
          ),
          widget.options.showMoreText
        ],
      ),
    );
  }

  Future<Widget> _buildFilterWidgets() async {
    List<Widget> children = [];

    for (AkoSearchFilterSelection selection
        in widget.options.filterSelections) {
      if (selection.selectionTerms.isEmpty) {
        List<AkoSearchFilterTerm> terms = await selection.fetchTerms!();
        Map<int, AkoSearchFilterTerm> termsMap = terms.asMap();

        selection.selectionTerms = termsMap;
        selection.selectionOptions = termsMap
            .map((key, value) => MapEntry<int, String>(key, value.name));
      }

      Widget child = _buildFilterWidget(selection);
      children.add(child);
      children.add(const SizedBox(height: 24));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 3,
                  color: widget.options.style.topDragIndicatorColor),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 13, right: 13, top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: _closeSelection,
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  Expanded(
                      flex: 4,
                      child: Center(child: widget.options.bottomSheetTitle)),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: AkoFuture(
                  future: _buildFilterWidgets(),
                  withNoData: (context) => Text("Wird geladen..."),
                  withError: (error, stacktrace) {
                    print(error);
                    print(stacktrace);
                    return Text("Fehler: $error");
                  },
                  withData: (data) {
                    return data;
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: widget.options.style.bottomButtonSeparator),
              ),
              child: Padding(
                padding: widget.options.style.bottomButtonPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: _clearSelection,
                        style: widget.options.style.clearButtonStyle,
                        child: widget.options.clearButtonText),
                    ElevatedButton(
                      onPressed: _applySelection,
                      style: widget.options.style.submitButtonStyle,
                      child: widget.options.submitButtonText,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
