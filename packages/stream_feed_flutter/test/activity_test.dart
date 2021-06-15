import 'package:flutter/material.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_feed_flutter/src/activity.dart';
import 'package:stream_feed_flutter/src/activity_content.dart';
import 'package:stream_feed_flutter/src/activity_header.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';

void main() {
  testWidgets('Activity', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StreamFeedActivity(
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
          ),
        ),
      );
      expect(find.byType(ActivityHeader), findsOneWidget);
      expect(find.byType(ActivityContent), findsOneWidget);
      expect(find.byType(ActivityFooter), findsOneWidget);
    });
  });
}