import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartseller/const/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:emartseller/const/const.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ✅ Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ Login Method
  Future<UserCredential?> loginMethod({required BuildContext context, required String usersCollection}) async {
    UserCredential? userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCredential.user;
      if (user != null) {
        // ensure Firestore user doc exists
        await _firestore.collection(usersCollection).doc(user.uid).set({
          'cart_count': "00",
          'wishlist_count': "00",
          'order_count': "00",
        }, SetOptions(merge: true));
      }

      // ✅ show success toast
      VxToast.show(context, msg: "Login successful");
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? "Login failed");
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

    // ✅ Vendor Login Method
  Future<UserCredential?> loginMethodVendor({required BuildContext context}) async {
    UserCredential? userCredential;
    isLoading(true);
    try {
      print("Attempting to log in with Email: ${emailController.text.trim()} and Password: ${passwordController.text.trim()}");
      userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final user = userCredential.user;
      if (user != null) {
        await _firestore.collection(vendorCollection).doc(user.uid).set({
          'vendor_name': '',
          'email': emailController.text.trim(),
          'id': user.uid,
        }, SetOptions(merge: true));
      }

      VxToast.show(context, msg: "Login successful");
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? "Login failed");
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    isLoading(false);
    return userCredential;
  }


  // ✅ Store User Data (after signup)
  Future<void> storeUserData({
    required String name,
    required String password,
    required String email,
    required String usersCollection,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      debugPrint("⚠️ No current user found while storing data.");
      return;
    }

    await _firestore.collection(usersCollection).doc(user.uid).set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': user.uid,
      'cart_count': "00",
      'wishlist_count': "00",
      'order_count': "00",
    }, SetOptions(merge: true));
  }

  // ✅ Signout Method
  Future<void> signoutMethod(BuildContext context) async {
    try {
      await _auth.signOut();
      emailController.clear();
      passwordController.clear();
      VxToast.show(context, msg: "Signed out successfully");
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
