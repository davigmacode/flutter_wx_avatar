import 'package:flutter/widgets.dart';
import 'theme_data.dart';

@immutable
class WxAvatarThemeDefaults extends WxAvatarThemeData {
  WxAvatarThemeDefaults(
    this.context, [
    WxAvatarThemeData? other,
  ]) : super.from(other);

  final BuildContext context;
}
