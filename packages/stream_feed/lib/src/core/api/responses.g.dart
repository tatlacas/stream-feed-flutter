// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map json) => ErrorResponse(
      duration: json['duration'] as String?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      statusCode: (json['status_code'] as num?)?.toInt(),
      detail: json['detail'] as String?,
      moreInfo: json['more_info'] as String?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'code': instance.code,
      'message': instance.message,
      'detail': instance.detail,
      'exception': instance.exception,
      'status_code': instance.statusCode,
      'more_info': instance.moreInfo,
    };
