import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/products_controller.dart';
import 'package:emartseller/views/product_screen/components/product_dropdown.dart';
import 'package:emartseller/views/product_screen/components/product_images.dart';
import 'package:emartseller/views/widgets/custom_textfield.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: white)),
        title: boldText(text: "Add Product",color: white,size: 16.0),
        actions: [
          TextButton(onPressed: (){}, child: boldText(text: save,color: white))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(8.0),
      child:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextField(
            hint: "eg. BMW",
            label: "Product Name",
            controller: controller.pnameController,
          ),
          10.heightBox,
          customTextField(
            hint: "eg. Nice Product",
            label: "Description",
            isDesc: true,
            controller: controller.pdescController,
          ),
          10.heightBox,
          customTextField(
            hint: "eg. \$100",
            label: "Price",
            controller: controller.ppriceController,
          ),
          10.heightBox,
          customTextField(
            hint: "eg. 20",
            label: "Quantity",
            controller: controller.pquantityController,
          ),
          10.heightBox,
          productDropdown("Category",controller.categoryList,controller.categoryvalue,controller),
          10.heightBox,
          productDropdown("Subcategory",controller.subcategoryList,controller.subcategoryvalue,controller),
          10.heightBox,
          Divider(),
          boldText(text: "Choose Product Images"),
          10.heightBox,
          Obx(()=>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:List.generate(3, (index)=> controller.pImagesList[index] != null ? Image.file(controller.pImagesList[index],width: 100).onTap((){
              controller.pickImage(index, context);
            }) :productImages(label: "${index + 1}").onTap((){
              controller.pickImage(index, context);
            })),
          ),
          ),
          5.heightBox,
          normalText(text: "First Image will be display Image",color: lightGrey),
          Divider(),
          10.heightBox,
          boldText(text: "Choose Products Colors"),
          10.heightBox,
          Obx(()=>
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children:List.generate(9, (index)=> Stack(
              alignment: Alignment.center,
              children: [
                VxBox().color(Vx.randomPrimaryColor).roundedFull.size(65, 65).make().onTap((){
                  controller.selectedColorIndex.value = index;
                }),
                controller.selectedColorIndex.value == index?  Icon(Icons.done,color: white) : SizedBox(),
              ]
            )
          )
          )
          )
        ],
      ),)
      )
    );
  }
}
