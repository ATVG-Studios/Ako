import 'package:flutter/material.dart';
import 'common_builder.dart';

class AkoFuture<T> extends StatelessWidget {
  const AkoFuture({super.key, required this.future, required this.withData, this.withNoData});

  final Future<T> future;
  final Widget? withNoData;
  final AkoFutureBuilder<T> withData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.data == null) return withNoData ?? Container();
          return withData(snapshot.data!);
        }
    );
  }
}
