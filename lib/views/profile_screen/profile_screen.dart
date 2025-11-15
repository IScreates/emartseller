import 'package:emartseller/const/const.dart';
import 'package:emartseller/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: settings,size: 16.0),
        actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: white,)),
          TextButton(onPressed: (){}, child: normalText(text: logout),
          )
        ],
      ),
      body: Column(
          children: [
            ListTile(
              leading: Image.asset(imgproduct).box.roundedFull.clip(Clip.antiAlias).make(),
              title: boldText(text: "Vendor Name"),
              subtitle: normalText(text: "vendoremail@emart.com"),
            ),
            Divider(),
            10.heightBox,
            Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(profileButtonIcons.length, (index)=>ListTile(
                leading: Icon(profileButtonIcons[index],color: white),
                title: normalText(text: profileButtonTitles[index],color: white),
              ))
            )
            ),
          ],
        ),
      );
  }
}