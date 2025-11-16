import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget orderPlaceDetails( { title1, title2,D1,data,D2}){
  return  Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title1",color: purpleColor),
              boldText(text: "$D1",color: red)
            ],
          ),
          SizedBox(
            width: 130,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldText(text: "$title2",color: purpleColor),
                boldText(text: "$D2",color: fontGrey)
              ],
            ),
          ),
        ],
      )
  );
}