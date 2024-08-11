import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_utils/wx_utils.dart';
import 'style.dart';

/// Defines the visual properties of [WxAvatar].
///
/// Descendant widgets obtain the current [WxAvatarThemeData] object using
/// `WxAvatarTheme.of(context)`. Instances of [WxAvatarThemeData]
/// can be customized with [WxAvatarThemeData.copyWith] or [WxAvatarThemeData.merge].
class WxAvatarThemeData extends ThemeExtension<WxAvatarThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of avatar widget.
  final Curve curve;

  /// The duration over which to animate the parameters of avatar widget.
  final Duration duration;

  /// The [WxAvatarStyle] to be applied to the avatar widget
  final WxAvatarStyle style;

  /// Creates a theme data that can be used for [AvatarTheme].
  const WxAvatarThemeData({
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 200),
    this.style = const WxAvatarStyle(),
  });

  /// Creates an [WxAvatarThemeData] from another one that probably null.
  WxAvatarThemeData.from([
    WxAvatarThemeData? other,
    WxAvatarThemeData fallback = const WxAvatarThemeData(),
  ])  : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// Creates a copy of this [WxAvatarThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxAvatarThemeData copyWith({
    Curve? curve,
    Duration? duration,
    WxAvatarStyle? style,
  }) {
    return WxAvatarThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [WxAvatarThemeData] but with
  /// the given fields replaced with the new values.
  WxAvatarThemeData merge(WxAvatarThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  WxAvatarThemeData lerp(ThemeExtension<WxAvatarThemeData>? other, double t) {
    if (other is! WxAvatarThemeData) return this;
    return WxAvatarThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: WxAvatarStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxAvatarThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}
