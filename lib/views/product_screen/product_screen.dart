import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/products_controller.dart';
import 'package:emartseller/services/store_services.dart';
import 'package:emartseller/views/product_screen/add_product.dart';
import 'package:emartseller/views/product_screen/product_details.dart';
import 'package:emartseller/views/widgets/appbar_widget.dart';
import 'package:emartseller/views/widgets/loading_indicator.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add, color: white),
      ),
      appBar: appbarWidget(products),
      body: StreamBuilder<QuerySnapshot>(
          stream: StoreServices.getProducts(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator(circleColor: Colors.white);
            } else {
              var data = snapshot.data!.docs;
              if (data.isEmpty) {
                return Center(
                    child: normalText(
                        text: "No products yet!", color: fontGrey));
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      children: List.generate(
                    data.length,
                    (index) {
                      var doc = data[index];
                      var docData = doc.data() as Map<String, dynamic>;

                      // Safe access to fields
                      final pImgs = docData.containsKey('p_imgs')
                          ? docData['p_imgs'] as List
                          : [];
                      final pName =
                          docData.containsKey('p_name') ? docData['p_name'] : 'No Name';
                      final pPrice =
                          docData.containsKey('p_price') ? docData['p_price'] : 'N/A';
                      
                      final dynamic isFeaturedRaw = docData.containsKey('is_featured') ? docData['is_featured'] : false;
                      final bool isFeatured;
                      if (isFeaturedRaw is bool) {
                        isFeatured = isFeaturedRaw;
                      } else if (isFeaturedRaw is String) {
                        isFeatured = isFeaturedRaw.toLowerCase() == 'true';
                      } else {
                        isFeatured = false;
                      }
                      final isOwnerOfFeature = docData.containsKey('featured_id') && docData['featured_id'] == currentUser!.uid;


                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  data: doc,
                                ));
                          },
                          leading: pImgs.isNotEmpty
                              ? Image.network(pImgs[0],
                                  width: 100, height: 100, fit: BoxFit.cover)
                              : Image.asset(imgproduct,
                                  width: 100, height: 100, fit: BoxFit.cover),
                          title: boldText(text: "$pName", color: fontGrey),
                          subtitle: Row(
                            children: [
                              normalText(text: "\$$pPrice", color: darkGrey),
                              10.widthBox,
                              Visibility(
                                  visible: isFeatured,
                                  child:
                                      boldText(text: "Featured", color: green))
                            ],
                          ),
                          trailing: VxPopupMenu(
                            child: const Icon(Icons.more_vert_rounded),
                            menuBuilder: () => Column(
                              children: List.generate(
                                popupMenuTitles.length,
                                (i) => Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Icon(popupMenuItems[i],
                                      color: isOwnerOfFeature && i == 0 ? green : darkGrey,
                                      ),
                                      10.widthBox,
                                      normalText(
                                          text: isOwnerOfFeature && i == 0 ? 'Remove Featured' :popupMenuTitles[i],
                                          color: darkGrey)
                                    ],
                                  ).onTap(() {
                                    switch (i) {
                                      case 0:
                                        if (isFeatured) {
                                          controller.removeFeatured(doc.id);
                                          VxToast.show(context, msg: "Removed from featured");
                                        } else {
                                          controller.addFeatured(doc.id);
                                          VxToast.show(context, msg: "Added to featured");
                                        }
                                        break;
                                      case 1:
                                        controller.removeProduct(doc.id);
                                        VxToast.show(context, msg: "Product removed");
                                        break;
                                      default:
                                        break;
                                    }
                                  }),
                                ),
                              ),
                            )
                                .box
                                .white
                                .rounded
                                .width(200)
                                .make(),
                            clickType: VxClickType.singleClick,
                          ),
                        ),
                      );
                    },
                  )),
                ),
              );
            }
          }),
    );
  }
}
