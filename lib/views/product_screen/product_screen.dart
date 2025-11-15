import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/appbar_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: const Icon(Icons.add, color: white),
      ),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
            20,
            (index) => ListTile(
              onTap: () {},
              leading: Image.asset(imgproduct,
                  width: 100, height: 100, fit: BoxFit.cover),
              title: boldText(text: "Product title", color: fontGrey),
              subtitle: normalText(text: "\$40.0", color: darkGrey),
              trailing: VxPopupMenu(
                child: const Icon(Icons.more_vert_rounded),
                menuBuilder: () => Column(
                  children: List.generate(
                    popupMenuTitles.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(popupMenuItems[index]),
                          10.widthBox,
                          normalText(
                              text: popupMenuTitles[index], color: darkGrey)
                        ],
                      ).onTap((){}),
                    ),
                  ),
                ).box.white.rounded.width(200).make(),
                clickType: VxClickType.singleClick,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
