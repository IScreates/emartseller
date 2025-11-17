import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emartseller/const/const.dart';
import 'package:emartseller/models/category_models.dart';
import 'package:emartseller/services/store_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductsController extends GetxController {
  var isloading = false.obs;
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesLink = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryvalue = ''.obs;
  var subcategoryvalue = ''.obs;
  var selectedColorIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
    populateCategoryList();
  }

  populateCategoryList() {
    categoryList.clear();
    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubCategory(cat) {
    subcategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();
    for (var i = 0; i < data.first.subcategory.length; i++) {
      subcategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages() async {
    pImagesLink.clear();
    for (var item in pImagesList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLink.add(n);
      }
    }
  }

  uploadProduct(context) async {
    var snapshot = await StoreServices.getProfile(currentUser!.uid);
    var sellerName = snapshot.docs.isNotEmpty ? snapshot.docs[0]['name'] : "";
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      'p_id': store.id,
      'is_featured': false,
      'p_imgs': FieldValue.arrayUnion(pImagesLink),
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_category': categoryvalue.value,
      'p_subcategory': subcategoryvalue.value,
      'p_colors': FieldValue.arrayUnion(
          [Colors.red.value, Colors.brown.value, Colors.blue.value]),
      'p_desc': pdescController.text,
      'p_name': pnameController.text,
      'p_price': ppriceController.text,
      'p_quantity': pquantityController.text,
      'p_seller': sellerName,
      'p_rating': "5.0",
      'vendor_id': currentUser!.uid
    });
  }

  addFeatured(docId) async {
    await firestore
        .collection(productsCollection)
        .doc(docId)
        .set({'is_featured': true, 'featured_id': currentUser!.uid}, SetOptions(merge: true));
  }

  removeFeatured(docId) async {
    await firestore
        .collection(productsCollection)
        .doc(docId)
        .set({'is_featured': false, 'featured_id': ''}, SetOptions(merge: true));
  }

  removeProduct(docId) async {
    await firestore.collection(productsCollection).doc(docId).delete();
  }
}
