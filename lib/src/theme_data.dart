import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_utils/wx_utils.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Avatar].
///
/// Descendant widgets obtain the current [AvatarThemeData] object using
/// `AvatarTheme.of(context)`. Instances of [AvatarThemeData]
/// can be customized with [AvatarThemeData.copyWith] or [AvatarThemeData.merge].
@immutable
class AvatarThemeData extends ThemeExtension<AvatarThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of avatar widget.
  final Curve curve;

  /// The duration over which to animate the parameters of avatar widget.
  final Duration duration;

  /// The [AvatarStyle] to be applied to the avatar widget
  final AvatarStyle style;

  /// Creates a theme data that can be used for [AvatarTheme].
  const AvatarThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [AvatarThemeData] with some reasonable default values.
  static const fallback = AvatarThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AvatarStyle.defaults,
  );

  /// Creates an [AvatarThemeData] from another one that probably null.
  AvatarThemeData.from([AvatarThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// An [AvatarThemeData] with default values.
  factory AvatarThemeData.defaults(BuildContext context) =>
      AvatarThemeDefaults(context);

  /// Creates a copy of this [AvatarThemeData] but with
  /// the given fields replaced with the new values.
  @override
  AvatarThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AvatarStyle? style,
  }) {
    return AvatarThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [AvatarThemeData] but with
  /// the given fields replaced with the new values.
  AvatarThemeData merge(AvatarThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  AvatarThemeData lerp(ThemeExtension<AvatarThemeData>? other, double t) {
    if (other is! AvatarThemeData) return this;
    return AvatarThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: AvatarStyle.lerp(style, other.style, t) ?? style,
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
    return other is AvatarThemeData && mapEquals(other.toMap(), toMap());
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
