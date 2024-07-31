import 'dart:ui';

import 'package:first_pj/core/themes/app_pallete.dart';

Color randomColor({required int index}) {
  if (index % 3 == 0) {
    return AppPallete.gradient3;
  } else if (index % 2 == 0) {
    return AppPallete.gradient2;
  } else {
    return AppPallete.gradient1;
  }
}
