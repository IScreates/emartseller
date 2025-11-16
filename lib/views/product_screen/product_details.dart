import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: darkGrey,
              )),
          title: boldText(text: "Product Title", color: fontGrey, size: 16.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                itemCount: 3,
                aspectRatio: 16 / 9,
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgproduct,
                    //data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Title and Rating
                    boldText(text: "Product Title", color: fontGrey, size: 16.0),

                    10.heightBox,
                    Row(
                      children: [
                        boldText(text: "Category",color: fontGrey,size: 16.0),
                        10.widthBox,
                        normalText(text: "Subcategory",color: fontGrey,size: 16.0),
                      ],
                    ),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: 3.0,
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      maxRating: 5,
                    ),
                    10.heightBox,
                    boldText(text: "\$300.0", color: red, size: 18.0),

                    20.heightBox,

                    // ✅ Color Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: boldText(text: "Color",color: fontGrey),
                              // child: "Color:"
                              //     .text
                              //     .color(textfieldGrey)
                              //     .make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    //.color(Color(int.parse(data['p_colors'][index].toString())).withOpacity(1.0))
                                    .margin(
                                      const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                    )
                                    .make()
                                    .onTap(() {
                                  //controller.changeColorIndex(index);
                                }),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                        .box
                        .white
                        .shadowSm
                        .padding(const EdgeInsets.all(8))
                        .make(),

                    20.heightBox,
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: boldText(text: "Quantity",color: fontGrey),
                          //child: "Quantity".text.color(textfieldGrey).make(),
                        ),
                        normalText(text: "20 items",color: fontGrey)
                      ],
                    )
                        .box
                        .white
                        .padding(const EdgeInsets.all(8.0))
                        .make(),
                    Divider(),
                    20.heightBox,

                    // ✅ Description Section

                    boldText(text: "Descripton",color: fontGrey),
                 //   "Description".text.color(darkFontGrey).fontFamily(semibold).make(),

                    10.heightBox,
                    normalText(text: "Description of this item",color: fontGrey)
                  ],
                )
              ),
            ],
          ),
        ));
  }
}
