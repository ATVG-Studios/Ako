import 'package:flutter/material.dart';
import 'common_builder.dart';

class AkoFuture<T> extends StatelessWidget {
  const AkoFuture({super.key, required this.future, required this.withData, this.withNoData, this.withError});

  final Future<T> future;
  final Widget? withNoData;
  final AkoFutureBuilder<T> withData;
  final AkoErrorBuilder? withError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.error != null) return withError?.call(snapshot.error!, snapshot.stackTrace) ?? Container();
          if(snapshot.data == null) return withNoData ?? Container();
          return withData(snapshot.data!);
        }
    );
  }
}
