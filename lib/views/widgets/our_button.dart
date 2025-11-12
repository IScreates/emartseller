import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: boldText(text: title, size: 16.0));
}
