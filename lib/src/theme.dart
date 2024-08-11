import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'theme_preset.dart';

/// A Widget that controls how descendant avatar should look like.
class WxAvatarTheme extends InheritedTheme {
  /// The properties for descendant [WxAvatar]s
  final WxAvatarThemeData data;

  /// Creates a theme that controls
  /// how descendant [WxAvatarTheme]s should look like.
  const WxAvatarTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [WxAvatarTheme] that controls the style of
  /// descendant widgets, and merges in the current [WxAvatarTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    WxAvatarStyle? style,
    WxAvatarThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = WxAvatarTheme.of(context);
        return WxAvatarTheme(
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

  /// The nullable [WxAvatarThemeData] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// WxAvatarThemeData theme = WxAvatarTheme.maybeOf(context);
  /// ```
  static WxAvatarThemeData? maybeOf(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<WxAvatarTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<WxAvatarThemeData>();
    return globalTheme;
  }

  /// The [WxAvatarThemeData] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// WxAvatarThemeData theme = WxAvatarTheme.of(context);
  /// ```
  static WxAvatarThemeData of(BuildContext context) {
    final parent = WxAvatarTheme.maybeOf(context);
    if (parent != null) return parent;

    return WxAvatarThemeDefault(context);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WxAvatarTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(WxAvatarTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WxAvatarThemeData>('data', data));
  }
}
