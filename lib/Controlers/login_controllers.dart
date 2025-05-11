import 'package:get/get.dart';

class LoginController extends GetxController {

  final RxBool isObscurePassword = true.obs;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController phoneNumbController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TapGestureRecognizer privacyPolicyRecognizer = TapGestureRecognizer();
  final RxBool isTapped = false.obs;
  final RxBool isTapBubble1 = false.obs;
  final RxBool isTapBubble2 = false.obs;
  final RxBool isTapBubble3 = false.obs;
  final RxBool isTapBubble4 = false.obs;
  final RxBool isFloating = false.obs;
  final RxBool isFront = true.obs;
  final RxBool isChecked = false.obs;
  final RxBool tapAnimation = false.obs;
  final RxDouble angle = RxDouble(0);

}