import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? currentUser = auth.currentUser;

final ref = currentUser!.uid;

final databaseRef = FirebaseDatabase.instance.ref(ref);
