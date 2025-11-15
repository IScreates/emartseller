import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/home_controller.dart';
import 'package:emartseller/views/profile_screen/profile_screen.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../orders_screen/orders_screen.dart';
import '../product_screen/product_screen.dart';
import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());
    var navScreens = [
      const HomeScreen(),
      const ProductScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];

    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),label: dashboard
      ),
       BottomNavigationBarItem(
        icon: Image.asset(icProducts,color: darkGrey,width: 24,),label: products
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icOrders,color: darkGrey,width: 24,),label: orders
      ),
       BottomNavigationBarItem(
        icon: Image.asset(icGeneralSettings,color: darkGrey,width: 24,),label: settings
      ),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        onTap: (index){
          controller.navIndex.value= index;
        },
          currentIndex: controller.navIndex.value,
        type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavbar),
      ),
      body: Obx(()=>Column(
        children: [
          Expanded(child: navScreens.elementAt(controller.navIndex.value),
          ),
        ],
      ),
      ),
    );
  }
}
