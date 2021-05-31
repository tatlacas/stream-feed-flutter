import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_feed_flutter/stream_feed_flutter.dart';

void main() {
  testWidgets('RepostButton', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: RepostButton(
        reaction: Reaction(kind: 'repost', childrenCounts: {
          'repost': 3
        }, ownChildren: {
          'repost': [
            Reaction(
              kind: 'repost',
            )
          ]
        }),
      ),
    )));

    final icon = find.byType(StreamSvgIcon);
    final activeIcon = tester.widget<StreamSvgIcon>(icon);
    final count = find.text('3');
    expect(count, findsOneWidget);
    expect(activeIcon.color, Colors.blue);
  });
}