// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModelResponse _$CatFactResponseFromJson(Map<String, dynamic> json) =>
    CatModelResponse(
      json['current_page'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => CatFact.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String,
      json['from'] as int,
      json['last_page'] as int,
      json['last_page_url'] as String,
      (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_page_url'] as String,
      json['path'] as String,
      json['per_page'] as int,
      json['prev_page_url'] as int?,
      json['to'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$CatFactResponseToJson(CatModelResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

CatFact _$CatFactFromJson(Map<String, dynamic> json) => CatFact(
      json['fact'] as String,
      json['length'] as int,
    );

Map<String, dynamic> _$CatFactToJson(CatFact instance) => <String, dynamic>{
      'fact': instance.fact,
      'length': instance.length,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      json['url'] as String?,
      json['label'] as String,
      json['active'] as bool,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
