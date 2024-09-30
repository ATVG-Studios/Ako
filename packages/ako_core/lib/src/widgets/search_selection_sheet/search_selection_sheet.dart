// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako_core/ako_core.dart';
import 'package:flutter/material.dart';

/// AkoSearchSelectionSheet is a bottom-sheet widget that implements a multi-select searchable list
/// The design and layout is inspired by TripAdvisor
class AkoSearchSelectionSheet extends StatefulWidget {
  const AkoSearchSelectionSheet({super.key, required this.options});

  final AkoSearchSelectionOptions options;

  @override
  State<AkoSearchSelectionSheet> createState() =>
      _AkoSearchSelectionSheetState();
}

class _AkoSearchSelectionSheetState extends State<AkoSearchSelectionSheet> {
  Map<int, String> selectableOptions = {};
  late List<int> selectedOptions;

  void _emitSelectionChanged() {
    widget.options.onSelectionChanged?.call(selectedOptions);
  }

  void _clearSelection() {
    selectedOptions.clear();
    setState(() {});
    _emitSelectionChanged();
  }

  void _applySelection() {
    _emitSelectionChanged();
    _closeSelection();
  }

  void _closeSelection() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _applyFilterToSelectable(String filter) {
    if (filter.isEmpty) {
      // make all possible options visible
      selectableOptions = widget.options.options;
    } else {
      // start with all possible options
      final filteredOptions = Map<int, String>.from(widget.options.options);
      // filter out all options that do not match the filter
      filteredOptions.removeWhere(
          (key, value) => !value.toLowerCase().contains(filter.toLowerCase()));
      // update the list of visible options
      selectableOptions = filteredOptions;
    }
    setState(() {});
  }

  @override
  void initState() {
    selectableOptions = widget.options.options;
    selectedOptions = widget.options.selectedOptions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.options.fieldOptions.onInputChanged = _applyFilterToSelectable;
    final selectableKeys = selectableOptions.keys.toList();
    final selectableValues = selectableOptions.values.toList();
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width / 5,
                height: 3,
                color: widget.options.style.topDragIndicatorColor),
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
            AkoSearchField(options: widget.options.fieldOptions),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: selectableOptions.length,
                  itemBuilder: (context, index) {
                    bool isSelected =
                        selectedOptions.contains(selectableKeys[index]);

                    return InkWell(
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: widget.options.style.listViewItemPadding,
                          child: ListTile(
                            title: Text(selectableValues[index]),
                            trailing: GestureDetector(
                              onTap: () {
                                if (!isSelected) {
                                  selectedOptions.add(selectableKeys[index]);
                                } else {
                                  selectedOptions.remove(selectableKeys[index]);
                                }
                                setState(() {});
                              },
                              child: AkoShowEither(
                                condition: isSelected,
                                onTrue: (context) =>
                                    const Icon(Icons.check_box),
                                onFalse: (context) =>
                                    const Icon(Icons.check_box_outline_blank),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
