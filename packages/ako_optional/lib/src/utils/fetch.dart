// Copyright 2023-2025 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:optional/optional_internal.dart';

typedef FetchFunction = Future<Map<String, dynamic>> Function();
typedef FetchJsonParser<T> = T Function(Map<String, dynamic>);

/// fetchJsonAsOptional is a helper for fetching and parsing JSON data.
Future<Optional<T>> fetchJsonAsOptional<T>(
    {required FetchJsonParser fromJson, required FetchFunction fetch}) async {
  final json = await fetch();
  if (json.isNotEmpty) {
    return Optional.of(fromJson(json));
  }
  return const Optional.empty();
}
