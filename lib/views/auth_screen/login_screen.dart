import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/auth_controller.dart';
import 'package:emartseller/views/home_screen/home.dart';
import 'package:emartseller/views/widgets/our_button.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
             40.heightBox,
            normalText(text: loginTo,size: 18.0,color: lightGrey),
            10.heightBox,


            Obx(()=>

            Column(
              children: [
                TextFormField(
                  controller: controller.emailController,
                  decoration: const  InputDecoration(
                    filled: true,
                    fillColor: textfieldGrey,
                    prefixIcon: Icon(Icons.email,color: purpleColor),
                    border: InputBorder.none,
                    hintText: emailHint
                  ),
                ),
                10.heightBox,
                TextFormField(
                  obscureText: true,
                  controller: controller.passwordController,
                  decoration: const  InputDecoration(
                      filled: true,
                      fillColor: textfieldGrey,
                      prefixIcon: Icon(Icons.lock,color: purpleColor),
                      border: InputBorder.none,
                      hintText: passwordHint
                  ),
                ),
                10.heightBox,
                Align( alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: normalText(text: forgotPassword,color: purpleColor))),
                20.heightBox,
                
                SizedBox(
                  width: context.screenWidth - 100,
                child: controller.isLoading.value ? loadingIndicator() : ourButton(
                  title: login,onPress: ()async {
                  await controller.loginMethodVendor(context: context).then((value) {
                      if (value != null) {
                        Get.offAll(() => const Home());
                      }
                    });
                },
                )
                ),
              ],
            ).box.white.rounded.outerShadowMd.padding(EdgeInsets.all(8)).make(),
            ),
            10.heightBox,
            Center(child: normalText(text: anyProblem,color: lightGrey)),
            const Spacer(),
            Center(child: boldText(text: credit)),
            20.heightBox,
          ],
      )
      ),
      ),
    );
  }
}

loadingIndicator({circleColor = purpleColor}) {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(purpleColor),
  );
}
