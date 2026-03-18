// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel _$PageModelFromJson(Map<String, dynamic> json) =>
    PageModel((json['next'] as num?)?.toInt(), (json['prev'] as num?)?.toInt());

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
  'next': instance.next,
  'prev': instance.prev,
};
