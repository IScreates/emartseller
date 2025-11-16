import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser=auth.currentUser;

const vendorCollection = "vendors",
    productsCollection = "products",
    chatCollection = "chats",
    messageCollection = "messages",
    ordersCollection = "orders";