import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_feed_flutter/src/utils/typedefs.dart';
import 'package:stream_feed_flutter/src/widgets/activity/activity.dart';
import 'package:stream_feed_flutter/src/widgets/dialogs/comment.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';
import 'package:animations/animations.dart';

enum TransitionType { material, cupertino, sharedAxisTransition }

///{@template flat_activity_list_page}
///The Page to display a list of activities
///This page is the main page of the app
///It displays a list of activities
///{@endtemplate}
class FlatActivityListPage extends StatelessWidget {
  ///{@macro flat_activity_list_page}
  const FlatActivityListPage({
    Key? key,
    this.feedGroup = 'user',
    this.onHashtagTap,
    this.onMentionTap,
    this.onUserTap,
    this.activityFooterBuilder,
    this.activityContentBuilder,
    this.activityHeaderBuilder,
    this.onProgressWidget = const ProgressStateWidget(),
    this.onErrorWidget = const ErrorStateWidget(),
    this.onEmptyWidget =
        const EmptyStateWidget(message: 'No activities to display'),
    this.onActivityTap,
    this.transitionType =
        TransitionType.material, //TODO: move this to core or theme
  }) : super(key: key);

  ///{@macro hashtag_callback}
  final OnHashtagTap? onHashtagTap;

  ///{@macro mention_callback}
  final OnMentionTap? onMentionTap;

  ///{@macro user_callback}
  final OnUserTap? onUserTap;

  /// A feed group to fetch activities for
  final String feedGroup;

  /// A builder to build the activity footer
  final ActivityFooterBuilder? activityFooterBuilder;

  /// A builder to build the activity content
  final ActivityContentBuilder? activityContentBuilder;

  /// A builder to build the activity header
  final ActivityHeaderBuilder? activityHeaderBuilder;

  ///{@macro activity_callback}
  final OnActivityTap? onActivityTap;

  /// A widget to display when theire is an error in the request
  final Widget onErrorWidget;

  /// A widget to display to show a loading progress
  final Widget onProgressWidget;

  /// A widget to display when there are no activities
  final Widget onEmptyWidget;

  ///Customise the transition
  final TransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return FlatFeedCore(
      onProgressWidget: onProgressWidget,
      onErrorWidget: onErrorWidget,
      //TODO: activity type Flat?
      feedBuilder: (context, activities, idx) => ActivityWidget(
        activity: activities[idx],
        feedGroup: feedGroup,
        onHashtagTap: onHashtagTap,
        onMentionTap: onMentionTap,
        onUserTap: onUserTap,
        activityHeaderBuilder: activityHeaderBuilder,
        activityFooterBuilder: activityFooterBuilder,
        activityContentBuilder: activityContentBuilder,
        onActivityTap: (context, activity) => onActivityTap != null
            ? onActivityTap?.call(context, activity)
            //TODO: provide a way to load via url / ModalRoute.of(context).settings with ActivityCore (todo)

            : pageRouteBuilder(
                activity: activity,
                context: context,
                transitionType: transitionType,
                page: CommentView(
                  enableReactions: true,
                  textEditingController:
                      TextEditingController(), //TODO: move this into props for customisation like buildSpans
                ),
              ),
      ),
      feedGroup: feedGroup,
    );
  }

  void pageRouteBuilder(
      {required BuildContext context,
      required TransitionType transitionType,
      required EnrichedActivity activity,
      required Widget page}) {
    final currentNavigator = StreamFeedCore.of(context).navigator!;
    switch (transitionType) {
      case TransitionType.material:
        currentNavigator.push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => page,
          ),
        );
        break;
      case TransitionType.cupertino:
        currentNavigator.push(
          CupertinoPageRoute<void>(
            builder: (BuildContext context) => page,
          ),
        );
        break;
      default:
        currentNavigator.push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (
            _,
            animation,
            secondaryAnimation,
            child,
          ) =>
              SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
        ));
    }
  }
}
