import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newapp/reposotory/auth_reposotory/signup_failuer.dart';
import 'package:newapp/screens/home/home_screen.dart';
import 'package:newapp/screens/login/login_screen.dart';

class AuthenticationReposotory extends GetxController {
  static AuthenticationReposotory get instance => Get.find();
  final _auth =FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
print("000000000000000000000000");
    ever(firebaseUser, _setInitialScreen);
    
    super.onReady();
  }

  _setInitialScreen(User? user){
    print(user!.email);
    
    user==null?Get.offAll(()=>Get.offAllNamed("/login")):Get.offAllNamed("/home");
  }

    Future<void> createUserWithEmailAndPassword(String email,String password) async{ 

      try {
       await _auth.createUserWithEmailAndPassword(email:email,password:password);
       firebaseUser.value!=null?Get.offAll(()=>Get.offAllNamed("/home")):Get.to(()=>Get.offAllNamed("/login"));
      }on FirebaseAuthException catch (e) {

        final ex=SignupFailure.code(e.code);
        print("222222");
        print(ex.message.toString());
        
      } catch(_){
        const ex=SignupFailure();
        print(ex.message);
        throw ex;
      }
    }

     Future<void> signInWithEmailAndPassword(String email,String password) async{
      try {
       await _auth.signInWithEmailAndPassword(email:email,password:password);
      }on FirebaseAuthException catch (e) {
        
      } catch(_){}
    }
    Future<void> logout() async {
      print("222222");
      _auth.signOut();
      Get.offAllNamed("/login");

      }
  }
