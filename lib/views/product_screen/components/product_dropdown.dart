import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/products_controller.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

Widget productDropdown(
    String hint, List<String> list, Rx<String> dropvalue, ProductsController controller) {
  return Obx(
    () => VxBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: normalText(text: hint, color: fontGrey),
          value: dropvalue.value.isEmpty ? null : dropvalue.value,
          isExpanded: true,
          items: list.map((e) {
            return DropdownMenuItem<String>(
              value: e,
              child: normalText(text: e, color: fontGrey),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              if (hint == "Category") {
                controller.subcategoryvalue.value = '';
                controller.populateSubCategory(newValue);
              }
              dropvalue.value = newValue;
            }
          },
        ),
      ),
    ).white.padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make(),
  );
}
