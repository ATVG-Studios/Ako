// Copyright 2023-2024 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:optional/optional_internal.dart';

typedef TryOptionalFutureFunction<T> = Future<Optional<T>> Function();

/// tryOptionalOrElse allows to get an elseValue when a optional future throws an error.
Future<Optional<T>> tryOptionalOrElse<T>(TryOptionalFutureFunction<T> future,
    {Optional<T> elseValue = const Optional.empty()}) async {
  try {
    return await future();
  } catch (e) {
    return elseValue;
  }
}

typedef TryFutureFunction<T> = Future<T> Function();

/// tryOrElse allows to get an elseValue when a future throws an error.
Future<Optional<T>> tryOrElse<T>(TryFutureFunction<T> future,
    {Optional<T> elseValue = const Optional.empty()}) async {
  try {
    return Optional.ofNullable(await future());
  } catch (e) {
    return elseValue;
  }
}
