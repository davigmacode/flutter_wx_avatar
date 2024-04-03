import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_box/wx_box.dart';
import 'package:animated_icon_theme/animated_icon_theme.dart';
import 'theme.dart';
import 'style.dart';

/// Display user profile image, initials or fallback icon
class Avatar extends StatelessWidget {
  /// Create an avatar widget
  const Avatar({
    Key? key,
    this.curve,
    this.duration,
    this.style,
    this.tooltip,
    this.onBaseImageError,
    this.onImageError,
    this.baseImage,
    this.image,
    this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// The style to be applied to the avatar.
  final AvatarStyle? style;

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

  @override
  Widget build(BuildContext context) {
    final theme = AvatarTheme.of(context);
    final themedStyle = theme.style.merge(style);
    final effectiveCurve = curve ?? theme.curve;
    final effectiveDuration = duration ?? theme.duration;
    Widget? result = child;

    if (result != null) {
      result = Center(
        child: MediaQuery.withNoTextScaling(
          child: AnimatedDefaultTextStyle(
            curve: effectiveCurve,
            duration: effectiveDuration,
            style: themedStyle.effectiveForegroundStyle,
            child: AnimatedIconTheme.merge(
              data: IconThemeData(
                color: themedStyle.effectiveForegroundStyle.color,
                size: themedStyle.effectiveForegroundStyle.fontSize,
              ),
              curve: effectiveCurve,
              duration: effectiveDuration,
              child: result,
            ),
          ),
        ),
      );
    }

    if (baseImage != null) {
      result = DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: baseImage!,
            onError: onBaseImageError,
            fit: BoxFit.cover,
          ),
          shape: themedStyle.effectiveShape,
        ),
        child: result,
      );
    }

    if (image != null) {
      result = DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image!,
            onError: onImageError,
            fit: BoxFit.cover,
          ),
          shape: themedStyle.effectiveShape,
        ),
        position: DecorationPosition.foreground,
        child: result,
      );
    }

    result = WxAnimatedBox(
      curve: effectiveCurve,
      duration: effectiveDuration,
      width: themedStyle.effectiveSize,
      height: themedStyle.effectiveSize,
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
      shape: themedStyle.wxBoxShape,
      child: result,
    );

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
    properties.add(DiagnosticsProperty<AvatarStyle?>('style', style));
  }
}
