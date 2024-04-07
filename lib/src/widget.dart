import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_box/wx_box.dart';
import 'package:animated_icon_theme/animated_icon_theme.dart';
import 'theme.dart';
import 'style.dart';

/// Display user profile image, initials or fallback icon
class WxAvatar extends StatelessWidget {
  /// Create an avatar widget
  const WxAvatar({
    super.key,
    this.animated = false,
    this.curve,
    this.duration,
    this.size,
    this.minSize,
    this.maxSize,
    this.border,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
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
    this.style,
    this.tooltip,
    this.onBaseImageError,
    this.onImageError,
    this.baseImage,
    this.image,
    this.child,
  })  : assert(size == null || (minSize == null && maxSize == null)),
        assert(baseImage != null || onBaseImageError == null),
        assert(image != null || onImageError == null);

  /// Create an avatar widget with circle shape
  const WxAvatar.circle({
    super.key,
    this.animated = false,
    this.curve,
    this.duration,
    double? radius,
    double? minRadius,
    double? maxRadius,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
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
    this.style,
    this.tooltip,
    this.onBaseImageError,
    this.onImageError,
    this.baseImage,
    this.image,
    this.child,
  })  : assert(radius == null || (minRadius == null && maxRadius == null)),
        assert(baseImage != null || onBaseImageError == null),
        assert(image != null || onImageError == null),
        border = const CircleBorder(),
        size = radius != null ? radius * 2 : null,
        minSize = minRadius != null ? minRadius * 2 : null,
        maxSize = maxRadius != null ? maxRadius * 2 : null;

  /// Whether to animate text style, icon theme, and other decoration on value changed.
  final bool animated;

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

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
  final Color? shadowColor;

  /// The avatar's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

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

  /// The style to be applied to the avatar.
  final WxAvatarStyle? style;

  /// Tooltip string to be used for the body area of the button.
  final String? tooltip;

  /// The background image of the circle. Changing the background
  /// image will cause the avatar to animate to the new image.
  ///
  /// Typically used as a fallback image for [image].
  ///
  /// If the [CircleAvatar] is to have the user's initials, use [child] instead.
  final ImageProvider? baseImage;

  /// The foreground image of the circle.
  ///
  /// Typically used as profile image. For fallback use [baseImage].
  final ImageProvider? image;

  /// An optional error callback for errors emitted when loading
  /// [baseImage].
  final ImageErrorListener? onBaseImageError;

  /// An optional error callback for errors emitted when loading
  /// [image].
  final ImageErrorListener? onImageError;

  /// The widget below this widget in the tree.
  final Widget? child;

  WxAvatarStyle get effectiveStyle => WxAvatarStyle.from(style).copyWith(
        size: size,
        minSize: minSize,
        maxSize: maxSize,
        border: border,
        margin: margin,
        clipBehavior: clipBehavior,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundSize: foregroundSize,
        foregroundColor: foregroundColor,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderColor: borderColor,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderAlign: borderAlign,
        borderStyle: borderStyle,
        borderRadius: borderRadius,
      );

  @override
  Widget build(BuildContext context) {
    final theme = WxAvatarTheme.of(context);
    final themedStyle = theme.style.merge(effectiveStyle);
    final effectiveCurve = curve ?? theme.curve;
    final effectiveDuration = duration ?? theme.duration;
    Widget? result = child;

    if (result != null) {
      if (animated) {
        result = AnimatedDefaultTextStyle(
          curve: effectiveCurve,
          duration: effectiveDuration,
          style: themedStyle.effectiveForegroundStyle,
          child: AnimatedIconTheme.merge(
            data: IconThemeData(
              color: themedStyle.effectiveForegroundColor,
              size: themedStyle.foregroundSize,
            ),
            curve: effectiveCurve,
            duration: effectiveDuration,
            child: result,
          ),
        );
      } else {
        result = DefaultTextStyle(
          style: themedStyle.effectiveForegroundStyle,
          child: IconTheme.merge(
            data: IconThemeData(
              color: themedStyle.effectiveForegroundColor,
              size: themedStyle.foregroundSize,
            ),
            child: result,
          ),
        );
      }

      result = Center(
        child: MediaQuery.withNoTextScaling(
          child: result,
        ),
      );
    }

    if (baseImage != null) {
      final baseImageDecoration = DecorationImage(
        image: baseImage!,
        onError: onBaseImageError,
        fit: BoxFit.cover,
      );
      result = DecoratedBox(
        decoration: themedStyle.isRectangle
            ? BoxDecoration(
                image: baseImageDecoration,
                borderRadius: themedStyle.borderRadius,
              )
            : ShapeDecoration(
                image: baseImageDecoration,
                shape: themedStyle.effectiveShape,
              ),
        child: result,
      );
    }

    if (image != null) {
      final imageDecoration = DecorationImage(
        image: image!,
        onError: onImageError,
        fit: BoxFit.cover,
      );
      result = DecoratedBox(
        decoration: themedStyle.isRectangle
            ? BoxDecoration(
                image: imageDecoration,
                borderRadius: themedStyle.borderRadius,
              )
            : ShapeDecoration(
                image: imageDecoration,
                shape: themedStyle.effectiveShape,
              ),
        position: DecorationPosition.foreground,
        child: result,
      );
    }

    if (animated) {
      result = WxAnimatedBox(
        curve: effectiveCurve,
        duration: effectiveDuration,
        constraints: themedStyle.constraints,
        margin: themedStyle.margin,
        clipBehavior: themedStyle.clipBehavior,
        shadowColor: themedStyle.shadowColor,
        elevation: themedStyle.elevation,
        color: themedStyle.effectiveBackgroundColor,
        borderColor: themedStyle.effectiveBorderColor,
        borderWidth: themedStyle.borderWidth,
        borderStyle: themedStyle.borderStyle,
        borderRadius: themedStyle.borderRadius,
        borderAlign: themedStyle.borderAlign,
        border: themedStyle.border,
        child: result,
      );
    } else {
      result = WxBox(
        constraints: themedStyle.constraints,
        margin: themedStyle.margin,
        clipBehavior: themedStyle.clipBehavior,
        shadowColor: themedStyle.shadowColor,
        elevation: themedStyle.elevation,
        color: themedStyle.effectiveBackgroundColor,
        borderColor: themedStyle.effectiveBorderColor,
        borderWidth: themedStyle.borderWidth,
        borderStyle: themedStyle.borderStyle,
        borderRadius: themedStyle.borderRadius,
        borderAlign: themedStyle.borderAlign,
        border: themedStyle.border,
        child: result,
      );
    }

    if (tooltip != null) {
      result = Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WxAvatarStyle?>('style', style));
  }
}
