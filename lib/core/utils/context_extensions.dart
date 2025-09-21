import 'package:flutter/widgets.dart';
import 'package:timelens/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get loc => S.of(this);
}
