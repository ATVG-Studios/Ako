import 'package:flutter/material.dart';
import 'package:optional/optional_internal.dart';
import 'common_builder.dart';

class AkoFutureOptional<T> extends StatelessWidget {
  const AkoFutureOptional({super.key, required this.future, required this.withData, this.withNoData, this.withFutureEmpty, this.withError});

  final Future<Optional<T>> future;
  final Builder? withNoData;
  final Builder? withFutureEmpty;
  final AkoFutureBuilder<T> withData;
  final AkoErrorBuilder? withError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.error != null) return withError?.call(snapshot.error!, snapshot.stackTrace) ?? Container();
          if(snapshot.data == null) return withNoData?.build(context) ?? Container();
          if(snapshot.data?.isEmpty == true) return withFutureEmpty?.build(context) ?? Container();
          return withData(snapshot.data!.value);
        }
    );
  }
}
