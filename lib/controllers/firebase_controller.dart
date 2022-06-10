import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Rxn<User> _firebaseUser = Rxn<User>();

  String? get imageurl => _firebaseUser.value?.photoURL;
  String? get user => _firebaseUser.value?.email;



  void google_sign_in() async {

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

    OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken);

    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    await _auth.signInWithCredential(oAuthCredential);



    // final User us = (await _auth.signInWithCredential(credential).then((value) => Get.offAllNamed(HomeScreenView())));

  }

  void google_sign_out() async {
    await googleSignIn.signOut();
  }
}