import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wx_utils/wx_utils.dart';
import 'package:wx_box/wx_box.dart';

/// The style to be applied to avatar widget
@immutable
class AvatarStyle with Diagnosticable {
  /// Create a raw avatar's style
  const AvatarStyle({
    this.size,
    this.shape,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderAlign,
    this.borderStyle,
    this.borderRadius,
  });

  /// Create an avatar's style with circle shape
  const AvatarStyle.circle({
    double? radius,
    this.shape,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderAlign,
    this.borderStyle,
    this.borderRadius,
  }) : size = radius != null ? radius * 2 : null;

  /// Create a avatar's style from another style
  AvatarStyle.from(AvatarStyle? other)
      : size = other?.size,
        shape = other?.shape,
        margin = other?.margin,
        clipBehavior = other?.clipBehavior,
        shadowColor = other?.shadowColor,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderAlign = other?.borderAlign,
        borderStyle = other?.borderStyle,
        borderRadius = other?.borderRadius;

  /// An [AvatarStyle] with some reasonable default values.
  static const defaults = AvatarStyle(
    size: 40.0,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderWidth: 1.0,
    borderStyle: BorderStyle.none,
    borderAlign: BorderSide.strokeAlignOutside,
  );

  /// The type of avatar's shape.
  final BoxShape? shape;

  /// The size of the avatar
  final double? size;

  /// Empty space to surround the outside avatar widget.
  final EdgeInsetsGeometry? margin;

  /// The avatar's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  final Clip? clipBehavior;

  /// When [elevation] is non zero the color to use for the avatar's shadow color.
  final Color? shadowColor;

  /// The avatar's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the avatar's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the avatar's label, icon, and checkmark
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// Color to be used for the avatar's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the avatar's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the avatar's border, in logical pixels.
  final double? borderWidth;

  /// The relative position of the stroke on a [BorderSide] in an
  /// [OutlinedBorder] or [Border].
  final double? borderAlign;

  /// The style of this side of the avatar's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The radii for each corner of the avatar's border.
  final BorderRadius? borderRadius;

  /// A square [Size] from [size] dimension
  double get effectiveSize => size ?? defaults.size!;

  /// [WxBoxShape] from [BoxShape] value
  BoxShape get effectiveShape => shape ?? defaults.shape!;

  /// [WxBoxShape] from [BoxShape] value
  WxBoxShape get wxBoxShape => WxBoxShape.values[effectiveShape.index];

  /// Computed background color with opacity and alpha
  Color? get effectiveBackgroundColor {
    return backgroundColor != null
        ? WxColors.withTransparency(
            backgroundColor!,
            opacity: backgroundOpacity,
            alpha: backgroundAlpha,
          )
        : WxColors.transparent;
  }

  /// Computed border color with opacity and alpha
  Color? get effectiveBorderColor {
    return borderColor != null
        ? WxColors.withTransparency(
            borderColor!,
            opacity: borderOpacity,
            alpha: borderAlpha,
          )
        : null;
  }

  /// Computed foreground color with opacity and alpha
  Color? get effectiveForegroundColor {
    return foregroundColor != null
        ? WxColors.withTransparency(
            foregroundColor!,
            opacity: foregroundOpacity,
            alpha: foregroundAlpha,
          )
        : null;
  }

  /// Computed foreground text style with foreground color
  TextStyle get effectiveForegroundStyle {
    return TextStyle(color: foregroundColor).merge(foregroundStyle);
  }

  /// Linearly interpolate between two icon theme data objects.
  static AvatarStyle? lerp(AvatarStyle? a, AvatarStyle? b, double t) {
    if (a == null && b == null) return null;
    return AvatarStyle(
      size: lerpDouble(a?.size, b?.size, t),
      shape: t < 0.5 ? a?.shape : b?.shape,
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      clipBehavior: t < 0.5 ? a?.clipBehavior : b?.clipBehavior,
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderAlign: lerpDouble(a?.borderAlign, b?.borderAlign, t),
      borderStyle: t < 0.5 ? a?.borderStyle : b?.borderStyle,
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }

  /// Creates a copy of this [AvatarStyle] but with
  /// the given fields replaced with the new values.
  AvatarStyle copyWith({
    double? size,
    BoxShape? shape,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    double? borderAlign,
    BorderStyle? borderStyle,
    BorderRadius? borderRadius,
  }) {
    return AvatarStyle(
      size: size ?? this.size,
      shape: shape ?? this.shape,
      margin: margin ?? this.margin,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderAlign: borderAlign ?? this.borderAlign,
      borderStyle: borderStyle ?? this.borderStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Creates a copy of this [AvatarStyle] but with
  /// the given fields replaced with the new values.
  AvatarStyle merge(AvatarStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      shape: other.shape,
      margin: other.margin,
      clipBehavior: other.clipBehavior,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderAlign: other.borderAlign,
      borderStyle: other.borderStyle,
      borderRadius: other.borderRadius,
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'shape': shape,
        'margin': margin,
        'clipBehavior': clipBehavior,
        'shadowColor': shadowColor,
        'elevation': elevation,
        'foregroundStyle': foregroundStyle,
        'foregroundColor': foregroundColor,
        'foregroundOpacity': foregroundOpacity,
        'foregroundAlpha': foregroundAlpha,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderAlign': borderAlign,
        'borderStyle': borderStyle,
        'borderRadius': borderRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AvatarStyle && mapEquals(other.toMap(), toMap());
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
