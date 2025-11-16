import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget productDropdown(){
  return DropdownButtonHideUnderline(child:
    DropdownButton<String>(
      hint: normalText(text: "Choose Category",color: fontGrey),
      value: null,
      isExpanded: true,
      items: [],
      onChanged: (value){}
    )
  ).box.white.padding(EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}