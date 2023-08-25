// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako/src/widgets/future/common_builder.dart';
import 'package:ako/widgets.dart';
import 'package:flutter/material.dart';

/// AkoBadge is a widget that takes a future and displays the returned list of [AkoBadgeLabel] as badges.
class AkoBadge extends StatefulWidget {
  const AkoBadge({Key? key, required this.labelsFuture, this.noDataLabel, this.style, this.withError, this.withNoData}) : super(key: key);

  final Future<List<AkoBadgeLabel>> labelsFuture;
  final String? noDataLabel;
  final AkoBadgeStyle? style;
  final AkoErrorBuilder? withError;
  final WidgetBuilder? withNoData;

  @override
  State<AkoBadge> createState() => _AkoBadgeState();
}

class _AkoBadgeState extends State<AkoBadge> {
  @override
  Widget build(BuildContext context) {
    return AkoFuture(
      future: widget.labelsFuture,
      withError: widget.withError,
      withNoData: widget.withNoData ?? (context) {
        return Text(widget.noDataLabel ?? "");
      },
      withData: (data) {
        final badges = data.map((label) => Padding(
          padding: widget.style?.paddingAround ?? const EdgeInsets.all(2.0),
          child: Badge(
            label: Text(label.label),
            textStyle: widget.style?.textStyle,
            largeSize: widget.style?.largeSize,
            backgroundColor: widget.style?.backgroundColor,
          ),
        )).toList();
        return Wrap(
          children: badges,
        );
      },
    );
  }
}
