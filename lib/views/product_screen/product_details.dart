import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> data;
  const ProductDetails({super.key, required this.data});

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
          title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                itemCount: data['p_imgs'].length,
                aspectRatio: 16 / 9,
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_imgs'][index],
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
                    boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),

                    10.heightBox,
                    Row(
                      children: [
                        boldText(text: "${data['p_category']}",color: fontGrey,size: 16.0),
                        10.widthBox,
                        normalText(text: "${data['p_subcategory']}",color: fontGrey,size: 16.0),
                      ],
                    ),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: double.tryParse(data['p_rating'].toString()) ?? 0.0,
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      maxRating: 5,
                    ),
                    10.heightBox,
                    boldText(text: "\$${data['p_price']}", color: red, size: 18.0),

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
                            ),
                            Row(
                              children: List.generate(
                                data['p_colors'].length,
                                (index) {
                                  final colorVal = data['p_colors'][index];
                                  final int colorInt =
                                      colorVal is int ? colorVal : (int.tryParse(colorVal) ?? 0);
                                  return VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .color(Color(colorInt).withOpacity(1.0))
                                      .margin(
                                        const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                      )
                                      .make()
                                      .onTap(() {});
                                },
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
                        ),
                        normalText(text: "${data['p_quantity']} items",color: fontGrey)
                      ],
                    )
                        .box
                        .white
                        .padding(const EdgeInsets.all(8.0))
                        .make(),
                    const Divider(),
                    20.heightBox,

                    // ✅ Description Section

                    boldText(text: "Description",color: fontGrey),

                    10.heightBox,
                    normalText(text: "${data['p_desc']}",color: fontGrey)
                  ],
                )
              ),
            ],
          ),
        ));
  }
}
