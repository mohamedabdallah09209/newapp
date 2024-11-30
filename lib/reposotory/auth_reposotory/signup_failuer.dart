class SignupFailure{
final String message;
const SignupFailure([this.message= "An Unknown error occurred."]);

factory SignupFailure.code(String code) {
switch(code){
case "weak-password":
return const SignupFailure("Please enter a stronger password. ");
case "invalid-email":
return const SignupFailure ("Email is not valid or badly formatted.");
case "emall-already-in-use":
return const SignupFailure("An account already exists for that email");
case "operation-not-allowed":
return const SignupFailure("Operation is not allowed. Please contact sopport.");
case "user-disabled":
return SignupFailure("This user has been disabled. Please contact support for help.");
default:
return const SignupFailure();
}}}