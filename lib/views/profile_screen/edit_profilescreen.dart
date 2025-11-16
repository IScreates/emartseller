import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile,size: 16.0,color: white),
        actions: [
          TextButton(onPressed: (){}, child: normalText(text: save),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imgproduct,width: 150).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
              ),
                onPressed: (){}, child: normalText(text: changeImage,color: fontGrey)
            ),
            10.heightBox,
            Divider(),
            customTextField(label: username,hint: "eg. Shreeyash shinde"),
            10.heightBox,
            customTextField(label: password,hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPass,hint: passwordHint)
          ],
        ),
      ),
    );
  }
}
