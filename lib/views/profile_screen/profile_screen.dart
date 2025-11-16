import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartseller/const/const.dart';
import 'package:emartseller/controllers/auth_controller.dart';
import 'package:emartseller/controllers/profile_controller.dart';
import 'package:emartseller/services/store_services.dart';
import 'package:emartseller/views/auth_screen/login_screen.dart';
import 'package:emartseller/views/profile_screen/edit_profilescreen.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings,size: 16.0),
        actions: [
            IconButton(onPressed: (){
              Get.to(()=>EditProfileScreen());
            }, icon: const Icon(Icons.edit,color: white,)),
          TextButton(onPressed: ()async{
            await Get.find<AuthController>().signoutMethod(context);
            Get.offAll(()=>LoginScreen());
          }, child: normalText(text: logout),
          )
        ],
      ),
      body: FutureBuilder(future: StoreServices.getProfile(currentUser!.uid), builder: (BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return loadingIndicator(circleColor: white);
        }else{

          controller.snapshotData = snapshot.data!.docs[0];
          return Column(
            children: [
              ListTile(
                leading: Image.asset(imgproduct).box.roundedFull.clip(Clip.antiAlias).make(),
                title: boldText(text: "${controller.snapshotData['vendor_name']}"),
                subtitle: normalText(text: "${controller.snapshotData['email']}"),
              ),
              const Divider(),
              10.heightBox,
              Padding(padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: List.generate(profileButtonIcons.length, (index)=>ListTile(
                        leading: Icon(profileButtonIcons[index],color: white),
                        title: normalText(text: profileButtonTitles[index],color: white),
                      ))
                  )
              ),
            ],
          );
        }
      }),
      );
  }
}
