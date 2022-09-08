import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_study_app/firebase_ref/references.dart';
import 'package:firebase_study_app/screens/home/home_screen.dart';
import 'package:firebase_study_app/screens/login/login_screen.dart';
import 'package:firebase_study_app/widgets/dialogs/dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{


  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges
    .listen((User? user) {
      _user.value = user;
    });


    navigateToIntroduction();
  }


  signInWithGoogle() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    print("signing in");
    try{
      print("step 1");
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      print("step 2 ${account}");
      if(account!=null){
        final _authAccount = await account.authentication;

        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch(error){
      print(error.toString());
    }
  }

  saveUser(GoogleSignInAccount account){
    UserRF.doc(account.email).set({
      "email":account.email,
      "name":account.displayName,
      "profilepic":account.photoUrl
    });
  }

  Future<void> signOut() async{
    try{
      await _auth.signOut();
      print("signed out");
      navigateToHomePage();
    } on FirebaseAuthException catch(e){
      print("${e}");
    }
  }

  void navigateToIntroduction(){
    Get.offAllNamed("/introduction");
  }

  void navigateToHomePage(){
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialogue(){
    Get.dialog(Dialogs().questionStartDialogue(onTap: (){
      Get.back();
      NavigatetoLoginPage();
    }),
      barrierDismissible: false
    );
  }

  void NavigatetoLoginPage(){
    Get.toNamed(LoginScreen.routeName);
  }


  bool isLoggerIn(){
    return _auth.currentUser != null;
  }

  User? getUser(){
    _user.value = _auth.currentUser;
    return _user.value;
  }
}