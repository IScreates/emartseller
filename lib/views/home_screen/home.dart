import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
      ),
       BottomNavigationBarItem(
        icon: Image.asset(icProducts),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icOrders),
      ),
       BottomNavigationBarItem(
        icon: Image.asset(icGeneralSettings),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: boldText(),
      ),
      body: Container(),
    );
  }
}
