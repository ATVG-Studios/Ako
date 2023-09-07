import 'package:ako/ako.dart';
import 'package:flutter/material.dart';

class AkoSearchSelection {
  AkoSearchSelectionOptions options;

  AkoSearchSelection(this.options);

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: options.bottomSheetShape,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AkoSearchSelectionSheet(
              options: options,
            );
          },
        );
      },
    );
  }
}

class AkoSearchSelectionOptions {
  Map<int, String> options;
  List<int> selectedOptions;
  Widget bottomSheetTitle;
  Widget clearButtonText;
  ButtonStyle? clearButtonStyle;
  Widget submitButtonText;
  ButtonStyle? submitButtonStyle;
  AkoSearchSelectionStyle? customStyle;
  AkoSearchFieldOptions? customFieldOptions;
  RoundedRectangleBorder bottomSheetShape;

  Function(List<int>)? onSelectionChanged;

  AkoSearchSelectionOptions(
      {this.options = const {},
      this.selectedOptions = const [],
      this.bottomSheetTitle = const Text(
        "Search",
        style: TextStyle(fontSize: 24),
      ),
      this.clearButtonText = const Text(
        "Clear filters",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      this.clearButtonStyle,
      this.submitButtonText = const Text("Apply"),
      this.submitButtonStyle,
      this.customStyle,
      this.customFieldOptions,
      this.onSelectionChanged,
      this.bottomSheetShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)))});

  AkoSearchSelectionStyle get style => customStyle ?? AkoSearchSelectionStyle();
  AkoSearchFieldOptions get fieldOptions =>
      customFieldOptions ?? AkoSearchFieldOptions();
}

class AkoSearchSelectionStyle {
  Color topDragIndicatorColor;
  Color listViewBackgroundColor;
  EdgeInsets listViewItemPadding;
  EdgeInsets bottomButtonPadding;
  BorderSide bottomButtonSeparator;

  AkoSearchSelectionStyle({
    this.topDragIndicatorColor = Colors.grey,
    this.listViewBackgroundColor = Colors.white,
    this.listViewItemPadding = const EdgeInsets.fromLTRB(13, 0, 13, 0),
    this.bottomButtonPadding = const EdgeInsets.all(8.0),
    this.bottomButtonSeparator = const BorderSide(color: Colors.grey, width: 1),
  });
}

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

  @override
  void initState() {
    selectableOptions = widget.options.options;
    selectedOptions = widget.options.selectedOptions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Center(
                          child: widget.options.bottomSheetTitle)
                  ),
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
                        color: widget.options.style.listViewBackgroundColor,
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
                        style: widget.options.clearButtonStyle,
                        child: widget.options.clearButtonText),
                    ElevatedButton(
                      onPressed: _applySelection,
                      style: widget.options.submitButtonStyle,
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
