import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wx_utils/wx_utils.dart';

/// The style to be applied to avatar widget
@immutable
class WxAvatarStyle with Diagnosticable {
  /// Create a raw avatar's style
  const WxAvatarStyle({
    this.size,
    this.minSize,
    this.maxSize,
    this.border,
    this.margin,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.shadows,
    this.foregroundStyle,
    this.foregroundSize,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundGradient,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
    this.borderRadius,
  });

  /// Create an avatar's style with circle shape
  const WxAvatarStyle.circle({
    double? radius,
    double? minRadius,
    double? maxRadius,
    this.margin,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.shadows,
    this.foregroundStyle,
    this.foregroundSize,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundGradient,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
    this.borderRadius,
  })  : border = const CircleBorder(),
        size = radius != null ? radius * 2 : null,
        minSize = minRadius != null ? minRadius * 2 : null,
        maxSize = maxRadius != null ? maxRadius * 2 : null;

  /// Create a avatar's style from another style
  WxAvatarStyle.from(WxAvatarStyle? other)
      : size = other?.size,
        minSize = other?.minSize,
        maxSize = other?.maxSize,
        border = other?.border,
        margin = other?.margin,
        clipBehavior = other?.clipBehavior,
        elevationColor = other?.elevationColor,
        elevation = other?.elevation,
        shadows = other?.shadows,
        foregroundStyle = other?.foregroundStyle,
        foregroundSize = other?.foregroundSize,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        backgroundGradient = other?.backgroundGradient,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderOffset = other?.borderOffset,
        borderStyle = other?.borderStyle,
        borderRadius = other?.borderRadius;

  /// An [WxAvatarStyle] with some reasonable default values.
  static const defaults = WxAvatarStyle(
    size: 40.0,
    border: RoundedRectangleBorder(),
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderWidth: 1.0,
    borderStyle: BorderStyle.none,
    borderOffset: BorderSide.strokeAlignOutside,
  );

  /// A border to draw.
  final OutlinedBorder? border;

  /// The size of the avatar
  final double? size;

  /// The minimum size of the avatar
  final double? minSize;

  /// The maximum size of the avatar
  final double? maxSize;

  /// Empty space to surround the outside avatar widget.
  final EdgeInsetsGeometry? margin;

  /// The avatar's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  final Clip? clipBehavior;

  /// When [elevation] is non zero the color to use for the avatar's shadow color.
  final Color? elevationColor;

  /// The avatar's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// A list of shadows cast by the [border].
  final List<BoxShadow>? shadows;

  /// The style to be applied to the avatar's label.
  ///
  /// The default label style is [TextTheme.titleMedium] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// Size to be apply to the Text or Icon.
  final double? foregroundSize;

  /// The color to be applied to the avatar's label, icon, and checkmark
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// A gradient to use when filling the shape.
  ///
  /// If a [backgroundColor] is specified, [backgroundGradient] must be null.
  final Gradient? backgroundGradient;

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
  final double? borderOffset;

  /// The style of this side of the avatar's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The radii for each corner of the avatar's border.
  final BorderRadius? borderRadius;

  BoxConstraints get constraints => BoxConstraints(
        minHeight: effectiveMinSize,
        minWidth: effectiveMinSize,
        maxWidth: effectiveMaxSize,
        maxHeight: effectiveMaxSize,
      );

  double get effectiveMinSize {
    if (size == null && minSize == null && maxSize == null) {
      return defaults.size!;
    }
    const defaultMinSize = 0.0;
    return size ?? minSize ?? defaultMinSize;
  }

  double get effectiveMaxSize {
    if (size == null && minSize == null && maxSize == null) {
      return defaults.size!;
    }
    const defaultMaxSize = double.infinity;
    return size ?? maxSize ?? defaultMaxSize;
  }

  /// A border to draw with default value [RoundRectangleBorder]
  OutlinedBorder get effectiveShape => border ?? defaults.border!;

  /// Whether or not this is rectangle shape
  bool get isRectangle =>
      effectiveShape is RoundedRectangleBorder ||
      effectiveShape is BeveledRectangleBorder ||
      effectiveShape is ContinuousRectangleBorder;

  /// Whether or not this is circle shape
  bool get isCircle => effectiveShape is CircleBorder;

  /// Computed background color with opacity and alpha
  Color? get effectiveBackgroundColor {
    return backgroundGradient == null
        ? backgroundColor != null
            ? WxColors.withTransparency(
                backgroundColor!,
                opacity: backgroundOpacity,
                alpha: backgroundAlpha,
              )
            : null
        : null;
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
    return const TextStyle().merge(foregroundStyle).copyWith(
          color: foregroundColor,
          fontSize: foregroundSize,
        );
  }

  /// Creates a copy of this [WxAvatarStyle] but with
  /// the given fields replaced with the new values.
  WxAvatarStyle copyWith({
    double? size,
    double? minSize,
    double? maxSize,
    OutlinedBorder? border,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    Color? elevationColor,
    double? elevation,
    List<BoxShadow>? shadows,
    TextStyle? foregroundStyle,
    double? foregroundSize,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Gradient? backgroundGradient,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    double? borderOffset,
    BorderStyle? borderStyle,
    BorderRadius? borderRadius,
  }) {
    return WxAvatarStyle(
      size: size ?? this.size,
      minSize: minSize ?? this.minSize,
      maxSize: maxSize ?? this.maxSize,
      border: border ?? this.border,
      margin: margin ?? this.margin,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      elevationColor: elevationColor ?? this.elevationColor,
      elevation: elevation ?? this.elevation,
      shadows: shadows ?? this.shadows,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundSize: foregroundSize ?? this.foregroundSize,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderOffset: borderOffset ?? this.borderOffset,
      borderStyle: borderStyle ?? this.borderStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Creates a copy of this [WxAvatarStyle] but with
  /// the given fields replaced with the new values.
  WxAvatarStyle merge(WxAvatarStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      minSize: other.minSize,
      maxSize: other.maxSize,
      border: other.border,
      margin: other.margin,
      clipBehavior: other.clipBehavior,
      elevationColor: other.elevationColor,
      elevation: other.elevation,
      shadows: other.shadows,
      foregroundStyle: other.foregroundStyle,
      foregroundSize: other.foregroundSize,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      backgroundGradient: other.backgroundGradient,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderOffset: other.borderOffset,
      borderStyle: other.borderStyle,
      borderRadius: other.borderRadius,
    );
  }

  /// Linearly interpolate between two icon theme data objects.
  static WxAvatarStyle? lerp(WxAvatarStyle? a, WxAvatarStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxAvatarStyle(
      size: lerpDouble(a?.size, b?.size, t),
      minSize: lerpDouble(a?.minSize, b?.minSize, t),
      maxSize: lerpDouble(a?.maxSize, b?.maxSize, t),
      border: OutlinedBorder.lerp(a?.border, b?.border, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      clipBehavior: t < 0.5 ? a?.clipBehavior : b?.clipBehavior,
      elevationColor: Color.lerp(a?.elevationColor, b?.elevationColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      shadows: BoxShadow.lerpList(a?.shadows, b?.shadows, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundSize: lerpDouble(a?.foregroundSize, b?.foregroundSize, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      backgroundGradient:
          Gradient.lerp(a?.backgroundGradient, b?.backgroundGradient, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderOffset: lerpDouble(a?.borderOffset, b?.borderOffset, t),
      borderStyle: t < 0.5 ? a?.borderStyle : b?.borderStyle,
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'minSize': minSize,
        'maxSize': maxSize,
        'border': border,
        'margin': margin,
        'clipBehavior': clipBehavior,
        'elevationColor': elevationColor,
        'elevation': elevation,
        'shadows': shadows,
        'foregroundStyle': foregroundStyle,
        'foregroundSize': foregroundSize,
        'foregroundColor': foregroundColor,
        'foregroundOpacity': foregroundOpacity,
        'foregroundAlpha': foregroundAlpha,
        'backgroundGradient': backgroundGradient,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderOffset': borderOffset,
        'borderStyle': borderStyle,
        'borderRadius': borderRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxAvatarStyle && mapEquals(other.toMap(), toMap());
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
