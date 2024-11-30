import 'package:get/get.dart';
import 'package:newapp/reposotory/auth_reposotory/authentication_reposotory.dart';
import 'package:newapp/reposotory/user_reposetory.dart';

class HomeController extends GetxController {

static  HomeController get instance => Get.find();

final _authRepo= Get.put(AuthenticationReposotory());
final _userRepo= Get.put (UserReposetory());
// Step 3 Get User Email and pass to UserRepository to fetch u
getUserData() {
  
final email = _authRepo.firebaseUser.value?.email;

if(email != null){
return _userRepo.getUserDetails(email);
} else {
Get.snackbar ("Error", "Login to continue");
}
}

}