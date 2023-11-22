import 'dart:developer';
import 'package:flutter/foundation.dart';

void kPrint(Object? data, {String? title = "private:"}) {
  if (kDebugMode) {
    log(data.toString(), name: title ?? "");
    debugPrint("$title ${data.toString()}");
  }
}
