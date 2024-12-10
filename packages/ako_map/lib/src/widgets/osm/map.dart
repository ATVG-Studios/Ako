// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ako_core/ako_core.dart';
import 'package:ako_map/src/widgets/osm/bottom_sheet.dart';
import 'package:ako_map/src/widgets/osm/map_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

export 'map_options.dart';

/// AkoOsmMap is a simple widget to show a OpenStreetMap map with a focused initial location.
///
/// When latitude and longitude are provided, the map will be centered on those coordinates.
/// Otherwise if centerPoint is provided, it will be the center of the map.
class AkoOsmMap extends StatefulWidget {
  AkoOsmMap({
    super.key,
    double? latitude,
    double? longitude,
    GeoPoint? centerPoint,
    AkoOsmMapOptions? options,
  }) {
    if (latitude != null && longitude != null) {
      this.centerPoint = GeoPoint(
        latitude: latitude,
        longitude: longitude,
      );
    } else if (centerPoint != null) {
      this.centerPoint = centerPoint;
    }
    this.options = options ?? AkoOsmMapOptions();
  }

  late final GeoPoint? centerPoint;
  late final AkoOsmMapOptions options;

  @override
  State<AkoOsmMap> createState() => _AkoOsmMapState();
}

class _AkoOsmMapState extends State<AkoOsmMap> {
  MapController? controller;

  @override
  initState() {
    super.initState();
    controller = MapController(initPosition: widget.centerPoint);
  }

  @override
  void dispose() {
    try {
      controller?.removeAllCircle();
      controller?.dispose();
    } catch (_) {}
    super.dispose();
  }

  Future<void> _showMapAsSheet(OSMFlutter map) async {
    if (!widget.options.allowBottomSheet) {
      return;
    }

    await AkoOsmBottomSheet(
      options: AkoOsmBottomSheetOptions(
        map: map,
        textMapTitle: widget.options.textSheetTitle,
      ),
    ).showBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return AkoShowEither(
      condition: controller != null,
      onFalse: (context) {
        return Center(child: Text(widget.options.textMapNotFound));
      },
      onTrue: (context) {
        OSMFlutter map = OSMFlutter(
          controller: controller!,
          osmOption: const OSMOption(
              zoomOption: ZoomOption(
            initZoom: 15,
          )),
          onMapIsReady: (isReady) async {
            if (widget.centerPoint != null) {
              await controller?.drawCircle(
                CircleOSM(
                  key: "circle0",
                  centerPoint: widget.centerPoint!,
                  radius: 200,
                  color: Colors.red.withAlpha(60),
                  strokeWidth: 1,
                ),
              );
            }
          },
        );

        return GestureDetector(
          onTap: () async {
            await _showMapAsSheet(map);
          },
          onDoubleTap: () async {
            await _showMapAsSheet(map);
          },
          onLongPress: () async {
            await _showMapAsSheet(map);
          },
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: map,
              ),
              AkoShowWhen(
                condition: widget.options.allowBottomSheet,
                builder: (context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    color: Colors.white,
                    child: Text(widget.options.textMapOpenSheet),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
