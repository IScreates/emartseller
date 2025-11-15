import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/dashboard_button.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard,color: darkGrey,size: 16.0),
        actions: [
          Center(
          child :normalText(text: intl.DateFormat('EEE, MMM d, ''yy').format(DateTime.now()),color: purpleColor),
          ),
          10.widthBox,
        ],
      ),
      body:   Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              dashboardButton(context,title: products,count: "60")

            ],
          ),
      )
    );
  }
}
