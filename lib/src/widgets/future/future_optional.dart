import 'package:flutter/material.dart';
import 'package:optional/optional_internal.dart';
import 'common_builder.dart';

class AkoFutureOptional<T> extends StatelessWidget {
  const AkoFutureOptional({super.key, required this.future, required this.withData, this.withNoData, this.withFutureEmpty});

  final Future<Optional<T>> future;
  final Widget? withNoData;
  final Widget? withFutureEmpty;
  final AkoFutureBuilder<T> withData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.data == null) return withNoData ?? Container();
          if(snapshot.data?.isEmpty == true) return withFutureEmpty ?? Container();
          return withData(snapshot.data!.value);
        }
    );
  }
}
