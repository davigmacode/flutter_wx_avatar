import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'theme_data.dart';
import 'style.dart';

mixin WxAvatarThemePreset on WxAvatarThemeData {
  BuildContext get context;

  ThemeData? _appTheme;
  ThemeData get appTheme => _appTheme ??= Theme.of(context);

  CupertinoThemeData? _cupertinoTheme;
  CupertinoThemeData get cupertinoTheme =>
      _cupertinoTheme ??= CupertinoTheme.of(context);

  TextTheme get textTheme => appTheme.textTheme;

  ColorScheme get colorScheme => appTheme.colorScheme;

  Color get primaryColor => colorScheme.primary;

  Color get transparentColor => Colors.transparent;

  TargetPlatform get platform => appTheme.platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  bool get isMacOS => platform == TargetPlatform.macOS;

  bool get isWindows => platform == TargetPlatform.windows;

  bool get isLinux => platform == TargetPlatform.linux;

  bool get isFuchsia => platform == TargetPlatform.fuchsia;

  bool get useMaterial3 => appTheme.useMaterial3;
}

abstract class WxAvatarThemeBase extends WxAvatarThemeData
    with WxAvatarThemePreset {
  @protected
  WxAvatarThemeBase(
    this.context, {
    super.curve,
    super.duration,
    super.style,
  });

  @override
  final BuildContext context;
}

class WxAvatarThemeDefault extends WxAvatarThemeBase {
  WxAvatarThemeDefault(
    super.context, {
    super.curve,
    super.duration,
    super.style,
  });

  @override
  get style => const WxAvatarStyle(
        size: 40.0,
        border: RoundedRectangleBorder(),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderWidth: 1.0,
        borderStyle: BorderStyle.none,
        borderOffset: BorderSide.strokeAlignOutside,
      ).merge(super.style);
}
