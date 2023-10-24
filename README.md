# Scrollable Positioned List
This is a widget by [google.dev](https://duckduckgo.com](https://pub.dev/publishers/google.dev)https://pub.dev/publishers/google.dev) that allows the building of a ListView lazily with the additional functionality to jump or scroll to any selected item.

In this example, i used the `ItemScrollController` and its `scrollTo` property that takes an index, a duration and an animation curve to scroll to the list item on the passed index.

## Note:
1. Replace the dates if testing this in the future i.e. after December 2023, to notice the effect.
2. Note that dates are represented linearly starting from the past through the present to the future. For this reason it is necessary to choose either future dates `selectedDate.isAfter(DateTime.now())` or past dates `DateTime.now().isAfter(selectedDate)`.
