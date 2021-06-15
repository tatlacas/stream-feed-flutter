import 'package:flutter/material.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_feed_flutter/src/activity_header.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

void main() {
  testWidgets('ActivityHeader', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: ActivityHeader(
          activityKind: 'like',
          activity: EnrichedActivity(
            time: DateTime.now(),
            actor: EnrichableField(
              User(data: {
                'name': 'Rosemary',
                'handle': '@rosemary',
                'subtitle': 'likes playing fresbee in the park',
                'profile_image':
                    'https://randomuser.me/api/portraits/women/20.jpg',
              }),
            ),
          ),
        ),
      )));

      final avatar = find.byType(Avatar);
      expect(avatar, findsOneWidget);

      final username = find.text('Rosemary').first;
      expect(username, findsOneWidget);

      final timeago = find.text('a moment ago').first;
      expect(timeago, findsOneWidget);

      final icon = find.byType(StreamSvgIcon);
      final activeIcon = tester.widget<StreamSvgIcon>(icon);
      expect(activeIcon.assetName, StreamSvgIcon.loveActive().assetName);

      final by = find.text('by').first;
      expect(by, findsOneWidget);
      final handle = find.text('@rosemary').first;
      expect(handle, findsOneWidget);
    });
  });
}