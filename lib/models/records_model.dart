import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'records_model.freezed.dart';
part 'records_model.g.dart';

@freezed
class Records with _$Records {
  factory Records({
    required DateTime date,
    required int weight,
    required String photoUrl,
    required String note,
  }) = _Records;

  factory Records.fromJson(Map<String, Object?> json) =>
      _$RecordsFromJson(json);
}
