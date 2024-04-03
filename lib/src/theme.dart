import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant avatar should look like.
class AvatarTheme extends InheritedTheme {
  /// The properties for descendant [Avatar]s
  final AvatarThemeData data;

  /// Creates a theme that controls
  /// how descendant [AvatarTheme]s should look like.
  const AvatarTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [AvatarTheme] that controls the style of
  /// descendant widgets, and merges in the current [AvatarTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AvatarStyle? style,
    AvatarThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AvatarTheme.of(context);
        return AvatarTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [AvatarTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AvatarTheme theme = AvatarTheme.of(context);
  /// ```
  static AvatarThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<AvatarTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<AvatarThemeData>();
    final defaultTheme = AvatarThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AvatarTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AvatarTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AvatarThemeData>('data', data));
  }
}
