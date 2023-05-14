import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notex/views/notes_view.dart';

class AuthServices {
  static Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = GoogleSignIn().currentUser;

    if (googleUser == null) {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.off(() => const NotesView()));
    } else {
      Get.off(() => const NotesView());
    }
  }

  static final GoogleSignInAccount? googleUser = GoogleSignIn().currentUser;
}
