// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_feed_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationFeedMeta _$NotificationFeedMetaFromJson(Map json) =>
    NotificationFeedMeta(
      unreadCount: (json['unread'] as num).toInt(),
      unseenCount: (json['unseen'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationFeedMetaToJson(
        NotificationFeedMeta instance) =>
    <String, dynamic>{
      'unread': instance.unreadCount,
      'unseen': instance.unseenCount,
    };
