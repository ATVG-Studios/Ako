import 'package:flutter/material.dart';

typedef AkoFutureBuilder<T> = Widget Function(T data);
typedef AkoErrorBuilder = Widget Function(Object error, StackTrace? stacktrace);
