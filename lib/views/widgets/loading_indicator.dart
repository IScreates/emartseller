import 'package:emartseller/const/const.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator({Color? color, required Color circleColor}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color ?? purpleColor),
    ),
  );
}
