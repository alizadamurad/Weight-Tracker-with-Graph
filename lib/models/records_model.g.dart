// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Records _$$_RecordsFromJson(Map<String, dynamic> json) => _$_Records(
      date: DateTime.parse(json['date'] as String),
      weight: json['weight'] as int,
      photoUrl: json['photoUrl'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$$_RecordsToJson(_$_Records instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'weight': instance.weight,
      'photoUrl': instance.photoUrl,
      'note': instance.note,
    };
