import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget dashboardButton(context,{title,count}){
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Expanded(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment : MainAxisAlignment.spaceAround,
          children: [
            boldText(text: title,size: 16.0),
            boldText(text: count,size: 20.0)
          ],
        ),
      ),
      Image.asset(icProducts,width: 40,color: white,)
    ],
  ).box.color(purpleColor).rounded.size(size.width * 0.4, 80).padding(EdgeInsets.all(8)).make();
}