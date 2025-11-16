import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget productImages({required label,onPress}){
  return "${label}".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
}