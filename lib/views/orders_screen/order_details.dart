import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/our_button.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'components/order_place.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: darkGrey)),
          title: boldText(text: "Order Datails", color: fontGrey, size: 16.0),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          width: context.screenWidth,
          child:
              ourButton(color: green, onPress: () {}, title: "Confirm Order"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order  delivery status section
                Visibility(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(text: "Order Status", color: fontGrey, size: 16.0),
                      SwitchListTile(
                        activeTrackColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: "Placed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeTrackColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: "Confirmed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeTrackColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "on Delivery", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeTrackColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "Delivered", color: fontGrey),
                      )
                    ],
                  )
                      .box
                      .padding(const EdgeInsets.all(8.0))
                      .outerShadowMd
                      .white
                      .border(color: lightGrey)
                      .roundedSM
                      .make(),
                ),
                Column(
                  children: [
                    orderPlaceDetails(
                      data: "data",
                      D1: "data['order_code']",
                      D2: "data['shipping_method']",
                      title1: "order Code",
                      title2: "shipping Method",
                    ),
                    orderPlaceDetails(
                      D1: DateTime.now(),
                      data: "data",
                      // D1 : "intl.DateFormat().add_yMd().format((data ['order_date'].toDate()))",
                      D2: "data['payment_method']",
                      title1: "Order Date",
                      title2: "Payment Method",
                    ),
                    orderPlaceDetails(
                      data: "data",
                      D1: "Unpaid",
                      D2: "Order Placed",
                      title1: "Payment Status",
                      title2: "Delivery Status",
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // "Shipping Address".text.fontFamily(semibold).make(),

                                boldText(
                                    text: "Shipping Address",
                                    color: purpleColor),
                                "{data['order_by_name']}".text.make(),
                                "{data['order_by_email']}".text.make(),
                                "{data['order_by_address']}".text.make(),
                                "{data['order_by_city']}".text.make(),
                                "{data['order_by_state']}".text.make(),
                                "{data['order_by_phone']}".text.make(),
                                "{data['order_by_postalcode']}".text.make(),
                              ],
                            ),
                            SizedBox(
                              width: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  boldText(
                                      text: "Total Amount", color: purpleColor),
                                  boldText(
                                      text: "\$300.0", color: red, size: 16.0),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                )
                    .box
                    .outerShadowMd
                    .white
                    .border(color: lightGrey)
                    .roundedSM
                    .make(),

                const Divider(),
                10.heightBox,
                boldText(text: "Ordered Products", color: fontGrey, size: 16.0),

                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(3, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          title1: "data['orders'][index]['title']".toString(),
                          title2: "data['orders'][index]['tprice']"
                              .toString()
                              .numCurrency,
                          D1: "{data['orders'][index]['qty']}x",
                          D2: "Refundable",
                          data: "data",
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: 30,
                              height: 20,
                              color: purpleColor,
                            )),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .margin(const EdgeInsets.only(bottom: 4))
                    .make(),

                20.heightBox,
              ],
            ),
          ),
        ));
  }
}
