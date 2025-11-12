import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/our_button.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(child:
      Padding(
          padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            30.heightBox,
            normalText(text: welcome, size: 18.0),
            20.heightBox,
            Row(children: [
            Image.asset(icLogo,width: 70,height: 70).box.border(color: white).rounded.padding(EdgeInsets.all(8)).make(),
            10.widthBox,
            boldText(text: appname,size: 20.0),
          ],
        ),

            60.heightBox,


            Column(
              children: [
                TextFormField(
                  decoration: const  InputDecoration(
                    prefixIcon: Icon(Icons.email,color: purpleColor),
                    border: InputBorder.none,
                    hintText: emailHint
                  ),
                ),
                10.heightBox,
                TextFormField(
                  decoration: const  InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: purpleColor),
                      border: InputBorder.none,
                      hintText: passwordHint
                  ),
                ),
                30.heightBox,
                
                SizedBox(
                  width: context.screenWidth - 100,
                child: ourButton(
                  title: login,onPress: (){},
                )
                ),
              ],
            ).box.white.rounded.outerShadowMd.padding(EdgeInsets.all(8)).make()
          ],
      )
      ),
      ),
    );
  }
}
