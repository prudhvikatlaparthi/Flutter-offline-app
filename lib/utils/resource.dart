import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class Resource<T> {
  const Resource._(this.data, this.error)
      : assert(!(data != null && error != null));

  const Resource.withData(T data) : this._(data, null);

  const Resource.withError(Object error) : this._(null, error);

  final T? data;

  T get requireData {
    if (hasData) return data!;
    if (hasError) throw error!;
    throw StateError('resource has neither data nor error');
  }

  final Object? error;

  Resource<T> inState() => Resource<T>._(data, error);

  bool get hasData => data != null;

  bool get hasError => error != null;

  @override
  String toString() =>
      '${objectRuntimeType(this, 'AsyncSnapshot')}($data, $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Resource<T> && other.data == data && other.error == error;
  }

  @override
  int get hashCode => hashValues(data, error);
}