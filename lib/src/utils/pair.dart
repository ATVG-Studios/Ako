// Copyright 2023 the Ako authors (https://pub.dev/packages/ako).
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

/// AkoPair implements a simple Pair (2 element Tuple)
class AkoPair<A, B> {
  final A first;
  final B second;

  const AkoPair({required this.first, required this.second});

  @override
  String toString() {
    return 'AkoPair($first, $second)';
  }

  AkoPair<B, A> swap() {
    return AkoPair(first: second, second: first);
  }
}
