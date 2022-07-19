import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  // ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider.value(value: FirebaseAuth.instance),
];

List<SingleChildWidget> dependentServices = [];