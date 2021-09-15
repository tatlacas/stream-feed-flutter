# Introduction to Stream Feeds

Stream Feeds is a service that helps you easily build a full social feeds experience in your Flutter (and more) apps.

This section of the documentation focuses on our Flutter SDK which helps you easily ship high quality feeds experiences in apps and programs built with the [Flutter toolkit made
by Google](https://flutter.dev).

The Stream Feeds Flutter SDK comprises of three different packages to choose from, ranging from low-level client control to a rich, out-of-the-box feeds experience.

The packages that make up the Stream Feeds Flutter SDK are:

1. <b>Low Level Client (stream_feed)</b>: a pure Dart package that can be used in any Dart project. It provides a low-level client to access the Stream Chat service. It contains no UI or Flutter widgets.
2. <b>Core (stream_feed_flutter_core)</b>: provides business-logic oriented Flutter widgets and classes to fetch common things required for integrating Stream Feeds into your application. Contains no UI.
3. <b>UI (stream_feed_flutter)</b>: includes both a low-level feeds client and a set of reusable and customizable UI components.

If you are building Flutter applications that require very custom UI, we recommend you use `stream_feed` or `stream_feed_flutter_core`. If you are looking to quickly prototype an application, we recommend using `stream_chat_flutter` as it provides the quickest and easiest way to get started.

# Basic Concepts
## Activities
In Stream Feeds, an item in a feed is called an `activity`. In its simplest form, an `activity` consists of an `actor`, a `verb`, and an `object`. It tells the story of a person performing an action on or with an object.

In its simplest form, adding an activity to a feed means passing an object with the following basic properties:
* `actor`
* `verb`
* `object`

It is also recommended to pass a foreign ID and the Time.

Let's take a look at the following example:

_“Erik is pinning Hawaii to his Places to Visit board.”_

We can identify the components of this activity as follows:
* The `actor` is "Eric" (User:1)
* The `verb` is "pin"
* The `object` is "Hawaii" (Place:42)
* The foreign ID is Eric's "Places to visit board"  (Activity:1)
* The time (for this example) would be `2017-07-01T20:30:45.123`

NOTE: As seen above, the timestamp does not contain any timezone data. However, all Stream timestamps are in UTC time.