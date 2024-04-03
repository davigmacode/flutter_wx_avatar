import 'package:flutter/widgets.dart';
import 'theme_data.dart';

@immutable
class AvatarThemeDefaults extends AvatarThemeData {
  AvatarThemeDefaults(
    this.context, [
    AvatarThemeData? other,
  ]) : super.from(other);

  final BuildContext context;
}
